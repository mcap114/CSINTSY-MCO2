document.addEventListener('DOMContentLoaded', () => {
    const zodiacButtons = document.querySelectorAll('.zodiac-btn');
    const sign1Display = document.getElementById('sign1-display');
    const sign2Display = document.getElementById('sign2-display');
    const signDisplay = document.getElementById('sign-display'); //for option1
    const resultDiv1 = document.getElementById('result1');
    const resultDiv2 = document.getElementById('result2');
    let selectedSign1 = null;
    let selectedSign2 = null;
    let selectedSign = null; //for option1 

    document.querySelector('#choice1').addEventListener('click', function(event) {
        event.preventDefault();
        document.querySelector('.option1').style.display = 'block';
        document.querySelector('.option2').style.display = 'none';
    });

    document.querySelector('#choice2').addEventListener('click', function(event) {
        event.preventDefault();
        document.querySelector('.option2').style.display = 'block';
        document.querySelector('.option1').style.display = 'none';
    });

    document.querySelector('#clearselection').addEventListener('click', function(event) {
        event.preventDefault();
        document.querySelector('.option1').style.display = 'none';
        document.querySelector('.option2').style.display = 'none';
    });

    zodiacButtons.forEach(button => {
        button.addEventListener('click', () => {
            const sign = button.getAttribute('data-sign');
            const option1Visible = document.querySelector('.option1').style.display === 'block';
            const option2Visible = document.querySelector('.option2').style.display === 'block';
            
            if (option2Visible) {
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
            } else if (option1Visible) {
                selectedSign = sign;
                signDisplay.textContent = `Sign: ${selectedSign}`;
            }
        });
    });
    
    document.getElementById('check-compatible-signs').addEventListener('click', () => {
        if (selectedSign) {
            fetch('/find-compatible-signs', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ sign: selectedSign }),
            })
            .then(response => response.json())
            .then(data => {
                resultDiv1.textContent = data.message;
            })
            .catch(error => {
                console.error('Error:', error);
                resultDiv1.textContent = 'An error occurred while checking compatible signs.';
            });
        } else {
            resultDiv1.textContent = 'Please select a zodiac sign.';
        }
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
                resultDiv2.textContent = data.message;
            })
            .catch(error => {
                console.error('Error:', error);
                resultDiv2.textContent = 'An error occurred while checking compatibility.';
            });
        } else {
            resultDiv2.textContent = 'Please select both zodiac signs.';
        }
    });


  
    
});


