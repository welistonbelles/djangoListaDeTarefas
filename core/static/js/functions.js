function doLogin() {
    window.location.href = "http://localhost:8000/admin/";
}

function doLogout() {
    window.location.href = "http://localhost:8000/admin/logout/"
}

function getTasks(is_anonymous = true) {
    var xhr = new XMLHttpRequest()
    xhr.open('GET', `http://localhost:8000/api/v1/tasks/${location.search.slice(1) ? "?" + location.search.slice(1) : window.location.href = "http://localhost:8000/?page=1"}`)
    xhr.send()
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            createTaskList(JSON.parse(xhr.responseText), is_anonymous);
        }
    }
}

function addNewTask(is_anonymous=true) {
    let text = `
    <modal id="content-add-task">
        <h2>Adicionar Tarefa</h2>
        <form action="POST" class="content-data">
           <input type="text" id="title" placeholder="Titulo" required>
            <textarea type="text" id="description" cols="30" rows="3" maxlength="300" placeholder="Descrição..." required></textarea>
            <select name="complexity" id="complexity">
                <option value="Facil">Fácil</option>
                <option value="Medio">Médio</option>
                <option value="Dificil">Difícil</option>
            </select>
            <div class="content-input">
                <h4>Concluída: </h4><input id="completed" type="checkbox">
            </div>
            <div class="content-buttons">
                <button type="button" class="confirmAddTask" onclick="confirmAddTask(${is_anonymous})">
                    <i class="far fa-save green"></i> Adicionar
                </button>
                <button type="button" class="cancelAdd" onclick="cancelAdd()">
                    <i class="far fa-window-close red"></i> Fechar
                </button>
            </div>
        </form>
    </modal>
    `;

    let content = document.querySelector('.content-actions-task');
    content.innerHTML = text;
    content.style.display = 'block';
    let modal = document.querySelector('#content-add-task');
    modal.style.display = 'flex';
}

function editTask(id, is_anonymous = true) {
    let task = document.querySelector('#task-' + id)
    let title = task.querySelector('.title').innerText;
    let description = task.querySelector('.description').innerText;
    let complexity = task.querySelector('.complexity').innerText;
    let completed = task.querySelector('.completed');
    
    let text = `
    <modal id="content-edit-task">
        <h2>Informações</h2>
        <form action="POST" class="content-data">
           <input type="text" id="title" placeholder="Titulo" value="${title}" required>
            <textarea type="text" id="description" cols="30" rows="3" maxlength="300" placeholder="Descrição..." required>${description}</textarea>
            <select name="complexity" id="complexity">
                <option value="Facil">Fácil</option>
                <option value="Medio">Médio</option>
                <option value="Dificil">Difícil</option>
            </select>
            <div class="content-input">
                <h4>Concluída: </h4><input id="completed" type="checkbox" ${completed ? "checked" : ""} >
            </div>
            <div class="content-buttons">
                <button type="button" class="attTask" onclick="attTask(${id}, ${is_anonymous})">
                    <i class="far fa-save green"></i> Salvar
                </button>
                <button type="button" class="cancelEdit" onclick="cancelEdit()">
                    <i class="far fa-window-close red"></i> Fechar
                </button>
            </div>
        </form>
    </modal>
    `;

    let content = document.querySelector('.content-actions-task');
    content.innerHTML = text;
    content.style.display = 'block';
    let modal = document.querySelector('#content-edit-task');
    modal.style.display = 'flex';

    
    if (complexity === 'Dificil' || complexity === 'dificil') {
        modal.querySelector('.content-data #complexity').selectedIndex = 2;
    } else if (complexity === 'Medio' || complexity === 'medio') {
        modal.querySelector('.content-data #complexity').selectedIndex = 1;
    } else {
        modal.querySelector('.content-data #complexity').selectedIndex = 0;
    }


}

function deleteTask(id, is_anonymous = true) {
    let task = document.querySelector('#task-' + id)
    let title = task.querySelector('.title').innerText;
    let description = task.querySelector('.description').innerText;
    let complexity = task.querySelector('.complexity').innerText;
    let completed = task.querySelector('.completed');

    console.log()
    let text = `
    <modal id="content-delete-task">
        <div class="info">
            <h2>Informações</h2>
        </div>
        <div class="content-msg">
            Você tem certeza que quer deletar a tarefa ${title}?
        </div>
        <div class="content-buttons">
            <button type="button" class="confirmDelete" onclick="confirmDeleteTask(${id}, ${is_anonymous})">
                <i class="far fa-save green"></i> Confirmar
            </button>
            <button type="button" class="cancelDelete" onclick="cancelDelete()">
                <i class="far fa-window-close red"></i> Fechar
            </button>
        </div>
    </modal>
    `;
    let content = document.querySelector('.content-actions-task');
    content.innerHTML = text;
    content.style.display = 'block';
    let modal = document.querySelector('#content-delete-task');
    modal.style.display = 'flex';
}

function createTaskList(tasks, is_anonymous) {
    let firstRow = document.querySelector('.first-row');
    let secondRow = document.querySelector('.second-row');
    let firstRowText = "";
    let secondRowText = "";

    if (!tasks.detail) {
        tasks.results.map((task, i) => {
            if (i <= 3) {
                firstRowText += `
                    <div class="task" id="task-${task.id}">
                        <div class="title">
                            <h3>${task.title}</h3>
                        </div>
                        <div class="content-data">
                            <strong>Descrição:</strong><span class="description">${task.description}</span><br><br>
                            <strong>Complexidade:</strong> <span class="complexity">${task.complexity}</span> <br><br>
                            <strong>Duração:</strong> <span class="duration">${task.duration}</span> <br><br>
                            <strong>Concluída:</strong> <span ${ task.completed ? 'class="completed"' : ''}> ${ task.completed ? '<i class="far fa-check-square green"></i>' : '<i class="far fa-window-close red"></i>'} </span>
                        </div>
                        <div class="actions">
                    `;
                
                if (!is_anonymous) {
                    firstRowText += `
                        <a onclick="editTask(${task.id}, ${is_anonymous})"><i class="far fa-edit blue-hover"> Editar </i></a>
                        <a onclick="deleteTask(${task.id}, ${is_anonymous})"><i class="fas fa-trash-alt red-hover"> Deletar</i></a>
                    `;
                }
                
                firstRowText += `
                    </div>
                </div>
                `;
            } else {
                secondRowText += `
                    <div class="task" id="task-${task.id}">
                        <div class="title">
                            <h3>${task.title}</h3>
                        </div>
                        <div class="content-data">
                            <strong>Descrição:</strong><span class="description">${task.description}</span><br><br>
                            <strong>Complexidade:</strong> <span class="complexity">${task.complexity}</span> <br><br>
                            <strong>Duração:</strong> <span class="duration">${task.duration}</span> <br><br>
                            <strong>Concluída:</strong> <span class="completed"> ${ task.completed ? '<i class="far fa-check-square green"></i>' : '<i class="far fa-window-close red"></i>'} </span>
                        </div>
                        <div class="actions">
                    `;
                
                if (!is_anonymous) {
                    secondRowText += `
                    <a onclick="editTask(${task.id}, ${is_anonymous})"><i class="far fa-edit blue-hover"> Editar </i></a>
                    <a onclick="deleteTask(${task.id}, ${is_anonymous})"><i class="fas fa-trash-alt red-hover"> Deletar</i></a>
                    `;
                }
                
                secondRowText += `
                    </div>
                </div>
                `;
            }
        }) 
    
        firstRow.innerHTML = firstRowText;
        secondRow.innerHTML = secondRowText;
    
        let count = tasks.count
        let pages = 0
        while (count > 0) {
            count -= 8;
            pages += 1;
        }
        
        let paginationRow = document.querySelector('.pagination-row');
        let paginationRowText = "";
        let url = window.location.href

        if (pages > 0 ) {
            if (tasks.previous != null) {
                paginationRowText += `
                    <a href="${tasks.previous != null ? "?page=" + (parseInt(url.charAt(url.length-1))-1): "#"}"><i class="fas fa-caret-left"></i></a>
                `;
            }
            
            for(page=1;page<=pages;page++) {
                if (page == url.charAt(url.length-1)) {
                    paginationRowText += `
                        <a class="active" href="#">${page}</a>
                    `
                } else {
                    paginationRowText += `
                        <a href="?page=${page}">${page}</a>
                    `
                }
            }
            if (tasks.next != null) {
                paginationRowText += `
                    <a href="${tasks.next != null ? "?page=" + (parseInt(url.charAt(url.length-1))+1) : "#"}"> <i class="fas fa-caret-right"></i></a>    
                `
            }
            paginationRow.innerHTML = paginationRowText;
        }
    } else {
        window.location.href = "http://localhost:8000/"
    }
}

function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function cancelEdit() {
    let content = document.querySelector('.content-actions-task');
    content.style.display = 'none';
    let modal = document.querySelector('#content-edit-task');
    modal.style.display = 'none';
}

function attTask(id, is_anonymous = true) {
    let task = document.querySelector('#content-edit-task')
    let title = task.querySelector('.content-data #title').value
    let description = task.querySelector('.content-data #description').value;
    let complexity = task.querySelector('.content-data #complexity').options[task.querySelector('.content-data #complexity').selectedIndex].value;
    let completed = task.querySelector('.content-data #completed').checked;

    var data = {
        title: title,
        description: description,
        complexity: complexity,
        completed: completed
    }

    let content = document.querySelector('.content-actions-task');
    content.style.display = 'none';
    let modal = document.querySelector('#content-edit-task');
    modal.style.display = 'none';

    if (is_anonymous) {
        console.log("Você precisa estar logado para realizar esta ação.")
    } else {
        const csrftoken = getCookie('csrftoken');
        const request = new Request(
            `http://localhost:8000/api/v1/tasks/${id}`,
            {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json', 
                    'Authorization': 'Token c59c67211b55396db3a90b2b94e1a7826e5b7d71',
                    'X-CSRFToken': csrftoken,
                },
                mode: 'same-origin',
                body: JSON.stringify(data)
            }
        )
        fetch(request).then(res => {
            console.log("Request complete! response:", res);
            getTasks(is_anonymous)
        })
    }
}

function cancelDelete() {
    let content = document.querySelector('.content-actions-task');
    content.style.display = 'none';
    let modal = document.querySelector('#content-delete-task');
    modal.style.display = 'none';
}


function confirmDeleteTask(id, is_anonymous) {
    if (is_anonymous) {
        console.log("Você precisa estar logado para realizar esta ação.");
    } else {
        const csrftoken = getCookie('csrftoken');
        const request = new Request(
            `http://localhost:8000/api/v1/tasks/${id}`,
            {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json', 
                    'Authorization': 'Token c59c67211b55396db3a90b2b94e1a7826e5b7d71',
                    'X-CSRFToken': csrftoken,
                },
                mode: 'same-origin',
            }
        )
        fetch(request).then(res => {
            console.log("Request complete! response:", res);
            getTasks(is_anonymous)
            let content = document.querySelector('.content-actions-task');
            content.style.display = 'none';
            let modal = document.querySelector('#content-delete-task');
            modal.style.display = 'none';
        })
    }
}

function cancelAdd() {
    let content = document.querySelector('.content-actions-task');
    content.style.display = 'none';
    let modal = document.querySelector('#content-add-task');
    modal.style.display = 'none';
}

function confirmAddTask(is_anonymous = true) {
    let task = document.querySelector('#content-add-task')
    let title = task.querySelector('.content-data #title').value
    let description = task.querySelector('.content-data #description').value;
    let complexity = task.querySelector('.content-data #complexity').options[task.querySelector('.content-data #complexity').selectedIndex].value;
    let completed = task.querySelector('.content-data #completed').checked;

    var data = {
        title: title,
        description: description,
        complexity: complexity,
        completed: completed
    }

    let content = document.querySelector('.content-actions-task');
    content.style.display = 'none';
    let modal = document.querySelector('#content-add-task');
    modal.style.display = 'none';

    if (is_anonymous) {
        console.log("Você precisa estar logado para realizar esta ação.")
    } else {
        const csrftoken = getCookie('csrftoken');
        const request = new Request(
            `http://localhost:8000/api/v1/tasks/`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json', 
                    'Authorization': 'Token c59c67211b55396db3a90b2b94e1a7826e5b7d71',
                    'X-CSRFToken': csrftoken,
                },
                mode: 'same-origin',
                body: JSON.stringify(data)
            }
        )
        fetch(request).then(res => {
            console.log("Request complete! response:", res);
            getTasks(is_anonymous)
        })
    }
}