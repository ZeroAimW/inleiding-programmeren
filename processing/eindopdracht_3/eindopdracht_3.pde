int x = 10;
int y = 10;
int rectWidth = 100;
int rectHeight = 100;
boolean dragging = false;
boolean gameOver = false;
boolean won = false;

void keyPressed() {
    if (key == 'r') {
        if (gameOver) {
            resetGame(); // Reset the game immediately
        }
    }
}

void resetGame() {
    x = 10;
    y = 10;
    dragging = false;
    gameOver = false;
    won = false; // Reset won status
}

void setup() {
    size(1000, 1000);
}

void draw() {
    background(100, 100, 100);

    // Draw walls (black parts)
    fill(0);
    rect(300, 800, 800, 200); // Wall 1
    rect(430, 550, 450, 110); // Wall 2
    rect(0, 150, 600, 510);   // Wall 3
    rect(750, 0, 400, 400);   // Wall 4

    // Draw Finish
    fill(255, 0, 0);
    rect(0, 660, 300, 1000);

    // Check if the game is over
    if (gameOver) {
        fill(255, 0, 0);
        textSize(64);
        textAlign(CENTER);
        text("Game Over", width / 2, height / 2);
        text("Press R to restart", width / 2, height / 2 + 80);
        return; // Stop further drawing
    }

    // Check for winning condition
    if (won) {
        fill(0, 255, 0);
        textSize(64);
        textAlign(CENTER);
        text("You Won!", width / 2, height / 2);
        return; // Stop further drawing
    }

    // Draw the draggable rectangle
    if (dragging) {
        x = mouseX - rectWidth / 2;
        y = mouseY - rectHeight / 2;

        // Check for wall collisions
        if (isColliding(x, y, rectWidth, rectHeight)) {
            gameOver = true; // End the game on collision
        }
    }

    // Color the rectangle based on whether it's being dragged
    fill(dragging ? color(0, 255, 0) : color(255, 0, 0));
    rect(x, y, rectWidth, rectHeight);
}

void mousePressed() {
    if (!gameOver && !won) {
        // Check if the mouse is inside the rectangle
        if (mouseX >= x && mouseX <= x + rectWidth &&
            mouseY >= y && mouseY <= y + rectHeight) {
            dragging = true;
        }
    }
}

void mouseReleased() {
    dragging = false;

    // Check for win condition (collision with the red area)
    if (isWinningArea(x, y, rectWidth, rectHeight)) {
        won = true; // Set the win state
    }
}

// Check if the rectangle collides with any walls
boolean isColliding(int x, int y, int w, int h) {
    return (x + w > 300 && x < 1100 && y + h > 800 && y < 1000) ||  // Wall 1
           (x + w > 430 && x < 880 && y + h > 550 && y < 660) ||   // Wall 2
           (x + w > 0 && x < 600 && y + h > 150 && y < 660) ||     // Wall 3
           (x + w > 750 && x < 1150 && y + h > 0 && y < 400);      // Wall 4
}

// Check if the rectangle is in the winning area
boolean isWinningArea(int x, int y, int w, int h) {
    return (x + w > 0 && x < 300 && y + h > 660 && y < 1660); // Check against the red area
}
