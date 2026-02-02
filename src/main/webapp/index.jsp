<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ICC T20 World Cup 2026</title>

<style>
/* ===== GLOBAL ===== */
body {
  margin: 0;
  font-family: "Segoe UI", Arial, sans-serif;
  background: #0b0f19;
  color: #ffffff;
}

/* ===== HERO SECTION ===== */
.hero {
  text-align: center;
  padding: 70px 20px;
  background: linear-gradient(135deg, #ff9800, #ff5722);
}

.hero h1 {
  font-size: 3.2rem;
  margin-bottom: 10px;
}

.hero p {
  font-size: 1.2rem;
}

/* ===== SECTIONS ===== */
section {
  padding: 50px 8%;
}

h2 {
  margin-bottom: 30px;
  color: #ffcc80;
}

/* ===== TEAMS ===== */
.team-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 25px;
}

.team-card {
  padding: 30px;
  text-align: center;
  border-radius: 14px;
  font-size: 1.3rem;
  font-weight: bold;
  cursor: pointer;
  transition: transform 0.4s, box-shadow 0.4s;
}

.team-card:hover {
  transform: scale(1.1);
  box-shadow: 0 0 25px rgba(255,255,255,0.3);
}

/* Team Colors */
.india { background: #1a237e; }
.australia { background: #fbc02d; color:#000; }
.england { background: #c62828; }
.pakistan { background: #1b5e20; }
.southafrica { background: #2e7d32; }
.newzealand { background: #212121; }

/* ===== PLAYERS ===== */
.player-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px,1fr));
  gap: 30px;
}

.player-card {
  background: #161b2e;
  padding: 25px;
  border-radius: 16px;
  text-align: center;
  transition: transform 0.3s, background 0.3s;
}

.player-card:hover {
  transform: translateY(-12px);
  background: #1f2645;
}

.player-card h3 {
  margin-bottom: 10px;
  color: #ffcc80;
}

/* ===== FOOTER ===== */
footer {
  text-align: center;
  padding: 25px;
  background: #000;
  color: #aaa;
  font-size: 0.9rem;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 600px) {
  .hero h1 {
    font-size: 2.2rem;
  }
}
</style>
</head>

<body>

<!-- HERO -->
<header class="hero">
  <h1>🏏 ICC T20 World Cup 2026</h1>
  <p>The Ultimate Cricket Battle</p>
</header>

<!-- TEAMS -->
<section>
  <h2>🌍 Participating Teams</h2>
  <div class="team-grid">
    <div class="team-card india">India</div>
    <div class="team-card australia">Australia</div>
    <div class="team-card england">England</div>
    <div class="team-card pakistan">Pakistan</div>
    <div class="team-card southafrica">South Africa</div>
    <div class="team-card newzealand">New Zealand</div>
  </div>
</section>

<!-- PLAYERS -->
<section>
  <h2>⭐ Star Players</h2>
  <div class="player-grid" id="players"></div>
</section>

<!-- FOOTER -->
<footer>
  © 2026 ICC T20 World Cup | Fan UI Project
</footer>

<!-- ===== JAVASCRIPT (INLINE) ===== -->
<script>
const players = [
  { name: "Virat Kohli", team: "India", role: "Batsman" },
  { name: "Rohit Sharma", team: "India", role: "Opener" },
  { name: "Babar Azam", team: "Pakistan", role: "Batsman" },
  { name: "Jos Buttler", team: "England", role: "Wicket Keeper" },
  { name: "David Warner", team: "Australia", role: "Opener" },
  { name: "Kane Williamson", team: "New Zealand", role: "Batsman" }
];

const container = document.getElementById("players");

players.forEach(player => {
  const card = document.createElement("div");
  card.className = "player-card";
  card.innerHTML = `
    <h3>${player.name}</h3>
    <p>🏳️ Team: ${player.team}</p>
    <p>🎯 Role: ${player.role}</p>
  `;
  container.appendChild(card);
});
</script>

</body>
</html>

