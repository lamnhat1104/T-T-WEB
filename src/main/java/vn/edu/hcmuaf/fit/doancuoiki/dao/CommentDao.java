package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
    public void addComment(Comment comment) {
        String sql = "INSERT INTO comments (product_id, username, comment) VALUES (?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, comment.getProductId());
            stmt.setString(2, comment.getUsername());
            stmt.setString(3, comment.getComment());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách bình luận theo ID sản phẩm
    public List<Comment> getCommentsByProduct(int productId) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE product_id = ? ORDER BY created_at DESC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("id"));
                comment.setProductId(rs.getInt("product_id"));
                comment.setUsername(rs.getString("username"));
                comment.setComment(rs.getString("comment"));
                comment.setCreatedAt(rs.getTimestamp("created_at"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    // Xóa bình luận theo ID
    public void deleteComment(int commentId) {
        String sql = "DELETE FROM comments WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        CommentDao dao = new CommentDao();
//        Comment comment = new Comment();
//        comment.setProductId(2);
//        comment.setUsername("chimm");
//        comment.setComment("san phảm tốt");
//        dao.addComment(comment);
//        System.out.println(dao.getCommentsByProduct(2));
//        Comment comment1 = new Comment();
//        comment1.setProductId(1);
//        comment1.setUsername("chimm");
//        comment1.setComment("Tuyệt vời");
//        dao.addComment(comment1);
//        System.out.println(dao.getCommentsByProduct(1));


    }
}
