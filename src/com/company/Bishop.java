package com.company;

public class Bishop extends Piece {


    Bishop(String color) {
        super(color);

    }


    @Override
    public void move(int xDimentionMove, int yDimentionMove) {





      boolean isPieceHavePlaceToMove =  isPieceHavePlaceToMove(xDimentionMove,yDimentionMove,this);

       boolean isTherePiece= isTherePiece(xDimentionMove,yDimentionMove,this);

      boolean isItOppositePiece =  isItOppositePiece(xDimentionMove,yDimentionMove,this);


        if (!isThereEmptySpace) {
            Piece piece = Board.board[super.getX() + xDimentionMove]
                    [super.getY() + yDimentionMove];
            isItOppositePiece = !this.getColor().equals(piece.getColor());
        }
        //sprwadzenie czy nie chce sie przemiescic o 0
        boolean isThisMoveIsExist=xDimentionMove == 0 && yDimentionMove == 0;


        if (!(isThisMoveIsExist&&
                isItspaceToDoMove&&
                (isThereEmptySpace||isItOppositePiece)
                )) {

            System.out.println("you cannot shift");
        } else {

            try {
                if (xDimentionMove == yDimentionMove) {

                    int X = super.getX();
                    int Y = super.getY();

                    super.setPiece(X + xDimentionMove, Y + yDimentionMove, this);

                }

            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("you cannot go out of board dude :/");
            }


        }


    }

    public boolean isPieceHavePlaceToMove(int x, int y, Piece piece){

        for (int i = 0; i < x; i++) {

            try {


                if (Board.board[super.getX() + i][super.getY() + i] != null) {
                    return false;
                }
            }catch (ArrayIndexOutOfBoundsException e){
                return false;
            }

        }
        return true;

    }


    public boolean isTherePiece(int x, int y, Piece piece){

        return Board.board[piece.getX() + x][piece.getY() + y] != null;
    }













    }





























