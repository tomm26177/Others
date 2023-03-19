package com.company;

import java.util.Scanner;

public class GamePanel extends Game {


    GamePanel() {
        while (isGameRun) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("type X location of piece to pick up " +
                    "(or type -10 to end)");
            int Xpiece = scanner.nextInt();
            if (Xpiece == -10) {
                System.exit(0);
                isGameRun = false;
            }
            System.out.println("type Y location of piece");
            int Ypiece = scanner.nextInt();

            if (Board.board[Xpiece][Ypiece] == null) {
                System.out.println("there is no any pice try oder");
            } else {
                System.out.println("now type possision to move:");
                Scanner scanner1 = new Scanner(System.in);
                System.out.println("shift about x:");
                int xMove = scanner1.nextInt();
                System.out.println("shift about y:");
                int yMove = scanner1.nextInt();

                Piece piece = Board.board[Xpiece][Ypiece];

                piece.move(xMove, yMove);
            }


        }


    }

}
