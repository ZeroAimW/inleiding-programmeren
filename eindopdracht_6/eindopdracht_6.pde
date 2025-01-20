int x = 10;
int y = 10;
int rectWidth = 100;
int rectHeight = 100;
boolean dragging = false;
boolean gameOver = false;
boolean won = false;
int level = 1; // Houdt het huidige level bij

// Arrays voor muren en blokken per level
int[][] wallsLevel1 = {
    {300, 800, 800, 200},
    {430, 550, 450, 110},
    {0, 150, 600, 510},
    {750, 0, 400, 400}
};

int[][] wallsLevel2 = {
    {0, 150, 850, 200},
    {980, 0, 920, 600},
    {0, 300, 600, 200},
    {770, 500, 300, 200},
    {150, 650, 620, 200}
};

// Winnende gebieden voor elk level
int[][] winningAreas = {
    {0, 660, 300, 1000},   // Level 1
    {750, 700, 300, 1000}  // Level 2
};

void keyPressed() {
    if (key == 'r') {
        if (gameOver) {
            resetGame();
        } else if (won) {
            nextLevel();
        }
    }
}

void resetGame() {
    x = 10;
    y = 10;
    dragging = false;
    gameOver = false;
    won = false;
}

void nextLevel() {
    level++;
    resetGame();
}

void setup() {
    size(1000, 1000);
}

void draw() {
    background(100, 100, 100);
    drawLevel();

    if (gameOver) {
        fill(255, 0, 0);
        textSize(64);
        textAlign(CENTER);
        text("Game Over", width / 2, height / 2);
        text("Press R to restart", width / 2, height / 2 + 80);
        return;
    }

    if (won) {
        fill(0, 255, 0);
        textSize(64);
        textAlign(CENTER);
        text("You Won!", width / 2, height / 2);
        text("Press R for next level", width / 2, height / 2 + 80);
        return;
    }

    if (dragging) {
        x = mouseX - rectWidth / 2;
        y = mouseY - rectHeight / 2;

        if (isColliding(x, y, rectWidth, rectHeight)) {
            gameOver = true;
        }
    }

    fill(dragging ? color(0, 255, 0) : color(255, 0, 0));
    rect(x, y, rectWidth, rectHeight);
}

void drawLevel() {
    fill(0);
    int[][] walls = (level == 1) ? wallsLevel1 : wallsLevel2;

    for (int[] wall : walls) {
        rect(wall[0], wall[1], wall[2], wall[3]);
    }

    // Teken het winnende gebied
    fill(255, 0, 0);
    rect(winningAreas[level - 1][0], winningAreas[level - 1][1], winningAreas[level - 1][2], winningAreas[level - 1][3]);
}

void mousePressed() {
    if (!gameOver && !won) {
        if (mouseX >= x && mouseX <= x + rectWidth &&
            mouseY >= y && mouseY <= y + rectHeight) {
            dragging = true;
        }
    }
}

void mouseReleased() {
    dragging = false;
    if (isWinningArea(x, y, rectWidth, rectHeight)) {
        won = true;
    }
}

boolean isColliding(int x, int y, int w, int h) {
    int[][] walls = (level == 1) ? wallsLevel1 : wallsLevel2;
    for (int[] wall : walls) {
        if (x + w > wall[0] && x < wall[0] + wall[2] && y + h > wall[1] && y < wall[1] + wall[3]) {
            return true;
        }
    }
    return false;
}

boolean isWinningArea(int x, int y, int w, int h) {
    int[] winningArea = winningAreas[level - 1];
    return (x + w > winningArea[0] && x < winningArea[0] + winningArea[2] &&
            y + h > winningArea[1] && y < winningArea[1] + winningArea[3]);
}
