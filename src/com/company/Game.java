package com.company;

public class Game {
    boolean isWhiteTurn=true;
    boolean isGameRun=true;
    Board board = new Board();
    Game() {
        startSetup();


    }

    public Board getBoard(){
        return board;
    }

    public void startSetup(){
        Pawn pawn1W = new Pawn("w");
        Pawn pawn2W = new Pawn("w");
        Pawn pawn3W = new Pawn("w");
        Pawn pawn4W = new Pawn("w");
        Pawn pawn5W = new Pawn("w");
        Pawn pawn6W = new Pawn("w");
        Pawn pawn7W = new Pawn("w");
        Pawn pawn8W = new Pawn("w");
        Rook rook1W = new Rook("w");
        Rook rook2W = new Rook("w");
        Horse horse1W = new Horse("w");
        Horse horse2W = new Horse("w");
        King kingW = new King("w");
        Queen queenW = new Queen("w");
        Bishop bishop1W = new Bishop("w");
        Bishop bishop2W = new Bishop("w");






        board.setPiece(0,1, pawn1W);
        board.setPiece(1,1, pawn2W);
        board.setPiece(2,1, pawn3W);
        board.setPiece(3,1, pawn4W);
        board.setPiece(4,1, pawn5W);
        board.setPiece(5,1, pawn6W);
        board.setPiece(6,1, pawn7W);
        board.setPiece(7,1, pawn8W);
        board.setPiece(0,0,rook1W);
        board.setPiece(1,0,horse1W);
        board.setPiece(2,0,bishop1W);
        board.setPiece(3,0,kingW);
        board.setPiece(4,0,queenW);
        board.setPiece(5,0,bishop2W);
        board.setPiece(6,0,horse2W);
        board.setPiece(7,0,rook2W);






        Pawn pawn1B = new Pawn("b");
        Pawn pawn2B = new Pawn("b");
        Pawn pawn3B = new Pawn("b");
        Pawn pawn4B = new Pawn("b");
        Pawn pawn5B = new Pawn("b");
        Pawn pawn6B = new Pawn("b");
        Pawn pawn7B = new Pawn("b");
        Pawn pawn8B = new Pawn("b");
        Rook rook1B = new Rook("b");
        Rook rook2B = new Rook("b");
        Horse horse1B = new Horse("b");
        Horse horse2B = new Horse("b");
        King kingB = new King("b");
        Queen queenB = new Queen("b");
        Bishop bishop1B = new Bishop("b");
        Bishop bishop2B = new Bishop("b");

        board.setPiece(0,1, pawn1B);
        board.setPiece(1,1, pawn2B);
        board.setPiece(2,1, pawn3B);
        board.setPiece(3,1, pawn4B);
        board.setPiece(4,1, pawn5B);
        board.setPiece(5,1, pawn6B);
        board.setPiece(6,1, pawn7B);
        board.setPiece(7,1, pawn8B);
        board.setPiece(0,0,rook1B);
        board.setPiece(1,0,horse1B);
        board.setPiece(2,0,bishop1B);
        board.setPiece(3,0,kingB);
        board.setPiece(4,0,queenB);
        board.setPiece(5,0,bishop2B);
        board.setPiece(6,0,horse2B);
        board.setPiece(7,0,rook2B);
    }


}
