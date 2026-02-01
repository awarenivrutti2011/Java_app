<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Step_up Classes</title>

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(to right, #1f4037, #99f2c8);
        }

        .container {
            max-width: 900px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            animation: fadeIn 1.2s ease-in;
        }

        h1 {
            color: #2c3e50;
            text-align: center;
        }

        h2 {
            color: #27ae60;
            margin-top: 30px;
        }

        .course {
            background: #f9f9f9;
            padding: 15px;
            border-left: 6px solid #27ae60;
            margin: 15px 0;
            border-radius: 5px;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            margin-top: 20px;
            background: #27ae60;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #219150;
        }

        #moreInfo {
            display: none;
            margin-top: 20px;
            color: #555;
        }

        footer {
            margin-top: 40px;
            text-align: center;
            color: #888;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>

    <script>
        function toggleInfo() {
            const info = document.getElementById("moreInfo");
            info.style.display = info.style.display === "none" ? "block" : "none";
        }
    </script>
</head>

<body>

<div class="container">
    <h1>🎓 Step_up Classes</h1>
    <p style="text-align:center;"><b>Contact:</b> awarenivrutti2011@gmail.com</p>

    <h2>📘 Courses Offered</h2>

    <div class="course">
        <b>Linux Administration</b><br>
        File system, permissions, shell scripting
    </div>

    <div class="course">
        <b>SQL Database</b><br>
        Queries, joins, indexes
    </div>

    <div class="course">
        <b>DevOps</b><br>
        Git, Jenkins, Docker, Kubernetes
    </div>

    <h2>🎯 Training Mode</h2>
    <p>Offline + Online</p>

    <button class="btn" onclick="toggleInfo()">Know More</button>

    <div id="moreInfo">
        <h2>🚀 Our Goal</h2>
        <p>
            We provide industry-ready training for freshers and working professionals
            with real-time projects, CI/CD pipelines, and hands-on labs.
        </p>
    </div>

    <footer>
        © 2026 Step_up Classes | Build your career with confidence
    </footer>
</div>

</body>
</html>
