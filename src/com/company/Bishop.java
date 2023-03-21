package com.company;

public class Bishop extends Piece {


    Bishop(String color) {
        super(color);

    }


    @Override
    public void move(int xDimentionMove, int yDimentionMove) {

        boolean isThereEmptySpace = Board.board[super.getX()+xDimentionMove]
                [super.getY()+yDimentionMove] == null;
        //sprawdzam czy jest pusto w miejsu gdzie idzie pionek
        boolean isItspaceToDoMove=true;

        //sprwadzam czy nie ma nic na drodze pionka
        for (int i = 0; i < xDimentionMove; i++) {

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


    }











    }





























