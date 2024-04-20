package com.company;

import java.util.List;

public abstract class Piece {
    private String color;
    private int x;
    private int y;

    public Piece(String color, int x, int y) {
        this.color = color;
        this.x = x;
        this.y = y;
    }

    public String getColor() {
        return color;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void setPiece(int x, int y, Piece piece) {
        Board.board[x][y] = piece;
        this.x = x;
        this.y = y;
    }

    public abstract void move(int x, int y){
        Move move = new Move(this,);
    }

    public abstract List<Move> getPossibleMoves(Board board, int startX, int startY);
}

