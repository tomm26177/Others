package com.company;

public class Pawn extends Piece{
    Pawn(String color){
        super(color);
    }

    @Override
    public void move(int xDimensionMove, int yDimensionsMove) {

        boolean isThereEmptySpace = false;
        try {


             isThereEmptySpace = Board.board[super.getX() + xDimensionMove]
                    [super.getY() + yDimensionsMove] == null;
        }catch (ArrayIndexOutOfBoundsException e){
            e.printStackTrace();
        }
        //sprawdzam czy jest pusto w miejsu gdzie idzie pionek
        boolean isItspaceToDoMove=true;

        //sprwadzam czy nie ma nic na drodze pionka
        for (int i = 0; i < xDimensionMove; i++) {

            if (Board.board[super.getX() + i][super.getY() + i] != null) {
                isItspaceToDoMove = false;
                break;
            }else {
                isItspaceToDoMove = true;
            }

        }
        //sprawdzam jaki kolor pionka stoi na miejscu docelowym
        boolean isItOppositePiece=false;

        //znajduje drugiego pionka i daje go do zmiennej


        if (!isThereEmptySpace) {
            Piece piece = Board.board[super.getX() + xDimensionMove]
                    [super.getY() + yDimensionsMove];
            isItOppositePiece = !this.getColor().equals(piece.getColor());
        }
        //sprwadzenie czy nie chce sie przemiescic o 0
        boolean isThisMoveIsExist=xDimensionMove == 0 && yDimensionsMove == 0;


        if (!  (isThisMoveIsExist && isItspaceToDoMove &&
                (isThereEmptySpace || isItOppositePiece)
        )) {

            System.out.println("you cannot shift");
        } else {

            try {
                //warunek przesuniecia o dwa
                boolean canPawngotwo = ( this.getColor().
                        equalsIgnoreCase("w")&&this.getY()==1) || (
                                this.getColor().equalsIgnoreCase("b")&&
                                        this.getY()==6
                        );

                if (true){

                    int X = super.getX();
                    int Y = super.getY();

                    super.setPiece(X + xDimensionMove, Y + yDimensionsMove, this);

                }

            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("you cannot go out of board dude :/");
            }


        }


    }
}
