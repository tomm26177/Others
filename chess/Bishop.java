package com.company;

public class Bishop extends Piece {

    public Bishop(String color) {
        super(color);
    }

    @Override
    public void move(int xDimentionMove, int yDimentionMove) {
        boolean isPieceHavePlaceToMove = isPieceHavePlaceToMove(xDimentionMove, yDimentionMove, this);
        boolean isTherePiece = isTherePiece(xDimentionMove, yDimentionMove, this);

        if (isPieceHavePlaceToMove) {
            try {
                if (Math.abs(xDimentionMove) == Math.abs(yDimentionMove)) {
                    int x = super.getX();
                    int y = super.getY();

                    super.setPiece(x + xDimentionMove, y + yDimentionMove, this);
                    System.out.println("Move successful");
                } else {
                    System.out.println("Invalid move: bishop can only move diagonally.");
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("Invalid move: the bishop cannot go out of the board.");
            }
        } else {
            System.out.println("Invalid move: the bishop cannot move to the selected position.");
        }
    }

    public boolean isPieceHavePlaceToMove(int x, int y, Piece piece) {
        if (x == 0 && y == 0) {
            return false;
        }

        int startX = piece.getX();
        int startY = piece.getY();

        for (int i = 1; i < Math.abs(x); i++) {
            int nextX = startX + i * Integer.signum(x);
            int nextY = startY + i * Integer.signum(y);

            if (Board.board[nextX][nextY] != null) {
                return false;
            }
        }
        return true;
    }

    public boolean isTherePiece(int x, int y, Piece piece) {
        if (piece != null) {
            int nextX = piece.getX() + x;
            int nextY = piece.getY() + y;

            return Board.board[nextX][nextY] != null;
        }
        return false;
    }
}




























