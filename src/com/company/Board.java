package com.company;

public  class Board {
   public static Piece[][] board = new Piece[8][8];

    Board() {
    }

    public void setPiece(int x, int y, Piece piece){
        piece.setX(x);
        piece.setY(y);
        board[x][y]=piece;
    }
}
