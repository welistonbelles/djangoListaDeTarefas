function requestRegisterAccount() {
    let email = document.querySelector('#Account-email').value
    let username = document.querySelector('#Account-user').value
    let password = document.querySelector('#Account-password').value

    if (email != "" && username != "" && password != "") {
        var data = {
            email: email,
            username: username,
            password: password
        }

        const csrftoken = getCookie('csrftoken');
        const request = new Request(
            `http://localhost:8000/account/api/create/`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken,
                },
                mode: 'same-origin',
                body: JSON.stringify(data)
            }
        )
        fetch(request).then(res => {
            if (res.status == "201") {
                window.location.href = "http://localhost:8000/";
                alert("Conta registrada com sucesso!")
            } else if (res.status == "400") {
                res.json().then(data => {
                    if (data.email != undefined) {
                        alert("Este e-mail já está cadastrado, tente outro.")
                    } else if (data.username != undefined) {
                        alert("Este usuário já está cadastrado, tente outro.")
                    } else if (data.password != undefined) {
                        alert(data.password)
                    }
                })
            }  
        })
    }
}