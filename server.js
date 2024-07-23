// server.js (Node.js example)

const express = require('express');
const bodyParser = require('body-parser');
const { exec } = require('child_process');

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(express.static('public'));

app.post('/compatibility', (req, res) => {
    const { sign1, sign2 } = req.body;

    exec(`swipl -s compatibility_system.pl -s utils.pl -g "compatibility_report('${sign1}', '${sign2}', Report), write(Report), nl, halt."`, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            res.status(500).json({ message: 'Error processing request' });
            return;
        }
        res.json({ message: stdout.trim() });
    });
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
