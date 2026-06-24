import socket
from flask import Flask, render_template_string

app = Flask(__name__) 

# Lightweight HTML template embedded directly to keep it to one file
HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
    <title>DevOps Target</title>
    <style>
        body { background: #0f172a; color: #f8fafc; font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: #1e293b; padding: 2rem; border-radius: 12px; box-shadow: 0 10px 15px -3px rgba(0,0,0,0.3); border-left: 5px solid #10b981; }
        h1 { color: #10b981; margin-top: 0; }
        .mono { font-family: monospace; background: #334155; padding: 4px 8px; border-radius: 4px; color: #38bdf8; }
    </style>
</head>
<body>
    <div class="card">
        <h1>🚀 Deployment Successful</h1>
        <p>Status: <span class="mono">HEALTHY (200 OK)</span></p>
        <p>Served from Hostname: <span class="mono">{{ hostname }}</span></p>
    </div>
</body>
</html>
"""

@app.route('/')
def home():
    # Grabs container/host ID dynamically (great for verifying load balancers)
    hostname = socket.gethostname()
    return render_template_string(HTML_TEMPLATE, hostname=hostname)

@app.route('/health')
def health():
    return {"status": "UP"}, 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) # nosec B104