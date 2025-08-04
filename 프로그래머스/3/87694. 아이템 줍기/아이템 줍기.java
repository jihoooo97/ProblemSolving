import java.util.Queue;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

class Solution {
    static int[][] maps = new int[102][102];
    static List<Rectangle> rects = new ArrayList<>();
    
    public int solution(int[][] rectangle, int characterX, int characterY, int itemX, int itemY) {
        Queue<int[]> queue = new LinkedList<>();
        
        int[] dx = {-1, 1, 0, 0};
        int[] dy = {0, 0, -1, 1};
        
        for(int[] rect : rectangle) {
            int minX = rect[0] * 2;
            int minY = rect[1] * 2;
            int maxX = rect[2] * 2;
            int maxY = rect[3] * 2;
            
            rects.add(new Rectangle(minX, minY, maxX, maxY));
            
            for(int x = minX; x <= maxX; x++) {
                for(int y = minY; y <= maxY; y++) {
                    maps[x][y] = -1;
                }
            }
        }
        
        int currentX = characterX * 2;
        int currentY = characterY * 2;
        int ix = itemX * 2;
        int iy = itemY * 2;
        
        queue.add(new int[]{currentX, currentY, 1});
        
        while(!queue.isEmpty()) {
            int[] current = queue.poll();
            currentX = current[0];
            currentY = current[1];
            
            if(currentX == ix && currentY == iy) {
                return (current[2] - 1) / 2;
            }
            
            maps[currentX][currentY] = current[2];
            
            for(int i = 0; i < 4; i++) {
                int nx = currentX + dx[i];
                int ny = currentY + dy[i];
                
                if(maps[nx][ny] < 0 && !inRect(nx, ny)) {
                    queue.add(new int[]{nx, ny, current[2] + 1});
                }
            }
        }
        
        return -1;
    }
    
    public boolean inRect(int x, int y) {
        for(Rectangle r : rects) {
            if(r.isRect(x, y)) {
                return true;
            }
        }
        return false;
    }
}

class Rectangle {
    int minX, minY;
    int maxX, maxY;
    
    public Rectangle(int minX, int minY, int maxX, int maxY) {
        super();
        this.minX = minX;
        this.minY = minY;
        this.maxX = maxX;
        this.maxY = maxY;
    }
    
    public boolean isRect(int x, int y) {
        if(x > minX && x < maxX && y > minY && y < maxY) {
            return true;
        } else {
            return false;
        }
    }
}