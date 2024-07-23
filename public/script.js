document.addEventListener('DOMContentLoaded', () => {
    const zodiacButtons = document.querySelectorAll('.zodiac-btn');
    const sign1Display = document.getElementById('sign1-display');
    const sign2Display = document.getElementById('sign2-display');
    const resultDiv = document.getElementById('result');
    let selectedSign1 = null;
    let selectedSign2 = null;

    zodiacButtons.forEach(button => {
        button.addEventListener('click', () => {
            const sign = button.getAttribute('data-sign');
            if (!selectedSign1) {
                selectedSign1 = sign;
                sign1Display.textContent = `First Sign: ${selectedSign1}`;
            } else if (!selectedSign2) {
                selectedSign2 = sign;
                sign2Display.textContent = `Second Sign: ${selectedSign2}`;
            } else {
                selectedSign1 = sign;
                selectedSign2 = null;
                sign1Display.textContent = `First Sign: ${selectedSign1}`;
                sign2Display.textContent = `Second Sign: None`;
            }
        });
    });

    document.getElementById('check-compatibility').addEventListener('click', () => {
        if (selectedSign1 && selectedSign2) {
            fetch('/compatibility', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ sign1: selectedSign1, sign2: selectedSign2 }),
            })
            .then(response => response.json())
            .then(data => {
                resultDiv.textContent = data.message;
            })
            .catch(error => {
                console.error('Error:', error);
                resultDiv.textContent = 'An error occurred while checking compatibility.';
            });
        } else {
            resultDiv.textContent = 'Please select both zodiac signs.';
        }
    });
});
