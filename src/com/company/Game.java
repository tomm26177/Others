package com.company;

import java.util.ArrayList;
import java.util.List;

public class Game {
    private final Board board;
    private final List<Move> moves;
    private String currentColor;

    public Game() {
        board = new Board();
        moves = new ArrayList<>();
        currentColor = "white";
    }

    public boolean makeMove(int startX, int startY, int endX, int endY) {
        Piece piece = board.getPiece(startX, startY);
        if (piece == null) {
            return false;
        }

        if (!piece.getColor().equals(currentColor)) {
            return false;
        }

        List<Move> possibleMoves = piece.getPossibleMoves(board, startX, startY);
        Move move = new Move(piece, startX, startY, endX, endY);
        if (!possibleMoves.contains(move)) {
            return false;
        }

        Piece capturedPiece = board.getPiece(endX, endY);
        if (capturedPiece != null) {
            board.removePiece(capturedPiece);
        }

        board.movePiece(startX, startY, endX, endY);
        moves.add(move);
        currentColor = currentColor.equals("white") ? "black" : "white";
        return true;
    }

    public boolean isCheckmate() {
        // Sprawdzenie czy król jest szachowany i czy nie ma możliwych ruchów
        return false;
    }
}
