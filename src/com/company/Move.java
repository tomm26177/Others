package com.company;


    public class Move {
        private final Piece piece;
        private final int startX;
        private final int startY;
        private final int endX;
        private final int endY;

        public Move(Piece piece, int startX, int startY, int endX, int endY) {
            this.piece = piece;
            this.startX = startX;
            this.startY = startY;
            this.endX = endX;
            this.endY = endY;
        }

        public Piece getPiece() {
            return piece;
        }

        public int getStartX() {
            return startX;
        }

        public int getStartY() {
            return startY;
        }

        public int getEndX() {
            return endX;
        }

        public int getEndY() {
            return endY;
        }
    }


