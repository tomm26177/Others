package com.company;

public class Board {
    private final Piece[][] board;
    private boolean isGameEnded;

    public Board() {
        board = new Piece[8][8];
        isGameEnded = false;
    }

    public void setPiece(int x, int y, Piece piece) {
        board[x][y] = piece;
    }

    public Piece getPiece(int x, int y) {
        return board[x][y];
    }

    public boolean movePiece(int startX, int startY, int endX, int endY) {
        Piece piece = getPiece(startX, startY);
        if (piece == null) {
            return false;
        }
        if (!piece.canMove(endX, endY, board)) {
            return false;
        }
        if (getPiece(endX, endY) != null && getPiece(endX, endY).getColor().equals(piece.getColor())) {
            return false;
        }
        setPiece(endX, endY, piece);
        setPiece(startX, startY, null);
        return true;
    }

    public boolean isPieceOnBoard(int x, int y) {
        return x >= 0 && x < 8 && y >= 0 && y < 8;
    }

    public boolean isAnyPieceOnBoard(String color) {
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 8; j++) {
                Piece piece = getPiece(i, j);
                if (piece != null && piece.getColor().equals(color)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isGameEnded() {
        return isGameEnded;
    }

    public void setGameEnded(boolean gameEnded) {
        isGameEnded = gameEnded;
    }
}
