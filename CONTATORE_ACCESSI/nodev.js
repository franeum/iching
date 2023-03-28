const path = require('path')
const Max = require('max-api')
const fs = require('fs')

let log_file = './accesses.txt'

// This will be printed directly to the Max console
Max.post(`Loaded the ${path.basename(__filename)} script`)

// Use the 'addHandler' function to register a function for a particular message
Max.addHandler("bang", () => {
	const d = new Date()

    fs.appendFile(log_file, `${d.toString()}\n`, function (err) {
        if (err) throw err
        console.log('Saved!')
      });
});

Max.addHandler("reset", () => {
    fs.access(log_file, fs.constants.F_OK, (err) => {
        if (err && err.code == "ENOENT")
            console.log("it not exists")
        else {
            fs.rm(log_file, function (err) {
                if (err) throw err;
                console.log('Removed!')
              });    
        }
    });
});

Max.addHandler("setfile", (pathfile) => {
    if (pathfile === "default")
        log_file = "./accesses.txt"  
    else {
        log_file = pathfile
    }  

    console.log(`set ${log_file} file`)
});

Max.addHandler("getfile", () => {
    console.log(log_file)    
});
