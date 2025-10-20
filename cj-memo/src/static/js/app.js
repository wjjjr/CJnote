// This file contains the front-end JavaScript code for the memo application.
// It handles user interactions and communicates with the backend API.

document.addEventListener("DOMContentLoaded", function() {
    const memoForm = document.getElementById("memoForm");
    const memoList = document.getElementById("memoList");

    memoForm.addEventListener("submit", function(event) {
        event.preventDefault();
        const title = document.getElementById("title").value;
        const content = document.getElementById("content").value;

        createMemo(title, content);
    });

    function createMemo(title, content) {
        fetch("/memos", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ title, content })
        })
        .then(response => response.json())
        .then(data => {
            addMemoToList(data);
            memoForm.reset();
        })
        .catch(error => console.error("Error:", error));
    }

    function addMemoToList(memo) {
        const listItem = document.createElement("li");
        listItem.textContent = `${memo.title}: ${memo.content}`;
        listItem.dataset.id = memo.id;

        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.addEventListener("click", function() {
            deleteMemo(memo.id);
        });

        listItem.appendChild(deleteButton);
        memoList.appendChild(listItem);
    }

    function deleteMemo(id) {
        fetch(`/memos/${id}`, {
            method: "DELETE"
        })
        .then(() => {
            const listItem = document.querySelector(`li[data-id='${id}']`);
            memoList.removeChild(listItem);
        })
        .catch(error => console.error("Error:", error));
    }

    function loadMemos() {
        fetch("/memos")
            .then(response => response.json())
            .then(data => {
                data.forEach(memo => addMemoToList(memo));
            })
            .catch(error => console.error("Error:", error));
    }

    loadMemos();
});