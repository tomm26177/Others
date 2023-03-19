package com.company;

public  class Piece extends Board {
   private int X;
   private int Y;
   private String color;
   Piece(String color){
       this.color=color;
   }




    public void move(int x,int y) {



    }

    public void remove(){
        Board.board[this.X][this.Y]=null;

    }


    public int getX() {
        return X;
    }

    public int getY() {
        return Y;
    }

    public String getColor() {
        return color;
    }

    public void setX(int x) {
        X = x;
    }

    public void setY(int y) {
        Y = y;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
