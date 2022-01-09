import requests
from requests.models import Response

class TestTask:
    headers = {'Authorization': 'Token c59c67211b55396db3a90b2b94e1a7826e5b7d71'}
    url_base_tasks = 'http://localhost:8000/api/v1/tasks/'

    def test_get_tasks(self):
        tasks = requests.get(url=self.url_base_tasks, headers=self.headers)

        assert tasks.status_code == 200

    def test_get_task(self):
        r = requests.get(url=self.url_base_tasks, headers=self.headers)
        assert r.status_code == 200
        tasks = r.json()['results']

        task = requests.get(url=f"{self.url_base_tasks}{tasks[-1]['id']}", headers=self.headers)

        assert task.status_code == 200

    def test_post_curso(self):
        new = {
            "title": "Tarefa 1",
            "description": "Realizar uma tarefa",
            "completed": False,
            "complexity": "Medio"
        }
        response = requests.post(url=self.url_base_tasks, headers=self.headers, data=new)
        
        assert response.status_code == 201

        assert response.json()['title'] == new['title']
    
    def test_put_curso(self):
        att = {
            "title": "Tarefa 1",
            "description": "Realizar uma tarefa",
            "completed": True,
            "complexity": "Medio"
        }

        r = requests.get(url=self.url_base_tasks, headers=self.headers)
        assert r.status_code == 200
        tasks = r.json()['results']

        response = requests.put(url=f"{self.url_base_tasks}{tasks[-1]['id']}", headers=self.headers, data=att)

        assert response.status_code == 202
        assert response.json()['completed'] == att['completed']

    def test_delete_curso(self):
        r = requests.get(url=self.url_base_tasks, headers=self.headers)
        assert r.status_code == 200
        tasks = r.json()['results']
        
        response = requests.delete(url=f"{self.url_base_tasks}{tasks[-1]['id']}", headers=self.headers)

        assert response.status_code == 204 and len(response.text) == 0