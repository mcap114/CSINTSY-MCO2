const express = require('express');
const bodyParser = require('body-parser');
const { exec } = require('child_process');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(express.static('public'));

app.post('/find-compatible-signs', (req, res) => {
    const { sign } = req.body;
    const query = `find_compatible_signs('${sign}', CompatibleSigns).`;

    exec(`swipl -q -s compatibility_system.pl -g "${query}" -t halt`, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            console.error(stderr);
            res.status(500).send({ error: 'Failed to execute Prolog command' });
            return;
        }
        res.send({ message: stdout.trim() });
    });
});

app.post('/compatibility', (req, res) => {
    const { sign1, sign2 } = req.body;
    const query = `compatibility_report('${sign1}', '${sign2}', Report).`;

    exec(`swipl -q -s compatibility_system.pl -g "${query}" -t halt`, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            console.error(stderr);
            res.status(500).send({ error: 'Failed to execute Prolog command' });
            return;
        }
        res.send({ message: stdout.trim() });
    });
});

app.post('/execute-prolog', (req, res) => {
    const { command } = req.body;
    exec(`swipl -q -s compatibility_system.pl -g "${command}" -t halt`, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            console.error(stderr);
            res.status(500).send({ error: 'Failed to execute Prolog command' });
            return;
        }
        res.send({ result: stdout.trim() });
    });
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
