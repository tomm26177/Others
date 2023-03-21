package com.company;

public class Bishop extends Piece {


    Bishop(String color) {
        super(color);

    }


    @Override
    public void move(int xDimentionMove, int yDimentionMove) {





      boolean isPieceHavePlaceToMove =  isPieceHavePlaceToMove(xDimentionMove,yDimentionMove,this);

       boolean isTherePiece= isTherePiece(xDimentionMove,yDimentionMove,this);

   //   boolean isItOppositePiece =  isItOppositePiece(xDimentionMove,yDimentionMove,this);



        if  (isPieceHavePlaceToMove) {

            try {
                if (xDimentionMove == yDimentionMove) {

                    int X = super.getX();
                    int Y = super.getY();

                    super.setPiece(X + xDimentionMove, Y + yDimentionMove, this);
                    System.out.println("move sucessful");
                }

            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("you cannot go out of board dude :/");
            }


        }else {
            System.out.println("you cant move");
        }


    }

    public boolean isPieceHavePlaceToMove(int x, int y, Piece piece){

        if(x==0&&y==0){
            return false;
        }

        for (int i = 1; i < x; i++) {

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





























