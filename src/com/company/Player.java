package com.company;

import java.util.HashSet;
import java.util.Set;

public class Player {
    private String name;
    private String color;
    private boolean isInCheck;
    private Set<Piece> pieces;

    public Player(String name, String color) {
        this.name = name;
        this.color = color;
        this.isInCheck = false;
        this.pieces = new HashSet<>();
    }

    public String getName() {
        return name;
    }

    public String getColor() {
        return color;
    }

    public boolean isInCheck() {
        return isInCheck;
    }

    public Set<Piece> getPieces() {
        return pieces;
    }

    public void addPiece(Piece piece) {
        pieces.add(piece);
    }

    public void removePiece(Piece piece) {
        pieces.remove(piece);
    }

    public void setInCheck(boolean inCheck) {
        isInCheck = inCheck;
    }

    public void movePiece(Piece piece, int x, int y) {
        piece.move(x, y);
    }

    public boolean hasPiece(Piece piece) {
        return pieces.contains(piece);
    }

    public boolean hasKing() {
        for (Piece piece : pieces) {
            if (piece instanceof King) {
                return true;
            }
        }
        return false;
    }

    public boolean isMoveValid(Piece piece, int x, int y) {
        // Sprawdzenie czy pole docelowe jest wolne
        if (Board.getPiece(x, y) != null) {
            return false;
        }
        // Sprawdzenie czy pionek należy do gracza
        if (!hasPiece(piece)) {
            return false;
        }
        // Sprawdzenie czy ruch pionkiem jest zgodny z zasadami gry
        return piece.isValidMove(x, y);
    }
}

