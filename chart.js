#!/usr/bin/env node

const vega = require('vega');
const fs = require('fs');
const { spawn } = require('child_process');
const readline = require('readline');

function chart(filename, data) {
    const spec = {
        "$schema": "https://vega.github.io/schema/vega/v3.0.json",
        "width": 1280,
        "height": 300,
        "padding": 4,
        "autosize": "fit",
        "background": "white",

        "config": {
            "axis": {
                "labelFontSize": 16,
                "titleFontSize": 14,
            },
        },

        "data": [{
            "name": "oset_benchmarks",
            "values": data,
        }],

        "scales": [{
            "name": "x",
            "type": "linear",
            "range": "width",
            "domain": {"data": "oset_benchmarks", "field": "x"},
        }, {
            "name": "y",
            "type": "band",
            "range": "height",
            "domain": {"data": "oset_benchmarks", "field": "y"},
            "padding": 0.06,
        }],

        "axes": [{
            "orient": "bottom",
            "scale": "x",
            "title": "Seconds",
        }, {
            "orient": "left",
            "scale": "y",
        }],

        "marks": [{
            "name": "bar",
            "type": "rect",
            "from": {"data": "oset_benchmarks"},
            "encode": {
                "enter": {
                    "x": {"scale": "x", "field": "x"},
                    "x2": {"scale": "x", "value": 0},
                    "y": {"scale": "y", "field": "y"},
                    "height": {"scale": "y", "band": 1},
                },
            },
        }, {
            "type": "text",
            "from": {"data": "bar"},
            "encode": {
                "enter": {
                    "text": {"field": "datum.x"},
                    "x": {"field": "x2", "offset": 5},
                    "y": {"field": "y", "offset": {"field": "height", "mult": 0.5}},
                    "baseline": {"value": "middle"},
                    "fontSize": {"value": 16},
                },
            },
        }],
    };


    const view = new vega.View(vega.parse(spec)).renderer('none').initialize();

    view.toCanvas().then(function(canvas) {
        fs.writeFileSync("Results/" + filename + ".png", canvas.toBuffer());
    }).catch(function(err) {
        console.log(err);
    });
}

var results = new Map();
var osetResults = [];

const swift = spawn("sh", ["mk"]);
const stdout = readline.createInterface({
	input: swift.stdout,
	crlfDelay: Infinity,
});

stdout.on('line', (data) => {
    if(!data.includes("measured")) {
        return;
    }
    data = data.split(" test", 2);
    var collectionName = data[0].split(".").pop().slice(0, -10);
    data = data[1].split("]'", 2);
    var functionName = data[0];
    var time = data[1].split(", ", 3)[1].split(": ").pop();

    console.log(collectionName, functionName, time);
    if(functionName.startsWith("OSetOnly")) {
        osetResults.push({"x": time, "y": functionName.substring(8)});
    } else {
        if(!results.has(functionName)) {
            results.set(functionName, []);
        }
        results.get(functionName).push({"x": time, "y": collectionName});
    }
});

function hasName(arr, name) {
    for(const a of arr) {
        if(a["y"] === name) {
            return true;
        }
    }
    return false;
}

swift.on('close', (code) => {
    if(code !== 0) {
        process.exit(code);
    }

    try {
        fs.mkdirSync("Results");
    } catch(err) {
        if(err.code !== "EEXIST") throw err
    }

    for(const [name, values] of results.entries()) {
        for(const value of values) {
            if(value["y"] === "OSet" && !hasName(osetResults, name)) {
                osetResults.push({"x": value["x"], "y": name});
            }
        }
    }

    chart("oset", osetResults);
    for(const [name, values] of results.entries()) {
        chart(name, values);
    }
});
