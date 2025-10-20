<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>备忘录应用</title>
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
    <header>
        <h1>备忘录应用</h1>
    </header>
    <main>
        <section id="memo-form">
            <h2>创建备忘录</h2>
            <form id="create-memo">
                <input type="text" id="title" placeholder="标题" required>
                <textarea id="content" placeholder="内容" required></textarea>
                <button type="submit">添加备忘录</button>
            </form>
        </section>
        <section id="memo-list">
            <h2>备忘录列表</h2>
            <ul id="memos"></ul>
        </section>
    </main>
    <script src="/static/js/app.js"></script>
</body>
</html>