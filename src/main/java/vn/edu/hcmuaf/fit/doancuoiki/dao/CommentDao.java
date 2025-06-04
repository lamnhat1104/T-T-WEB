package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Comment;

import java.sql.*; // Import Timestamp
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
    // Modified to return the inserted Comment object
    public static Comment insertComment(int productId, String username, String content) {
        String sql = "INSERT INTO comments (product_id, username, comment, created_at) VALUES (?, ?, ?, NOW())";
        String selectSql = "SELECT * FROM comments WHERE id = ?";
        Comment newComment = null;

        try (Connection conn = new DBContext().getConnection()) {
            // Use PreparedStatement.RETURN_GENERATED_KEYS to get the auto-generated ID
            try (PreparedStatement psInsert = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                psInsert.setInt(1, productId);
                psInsert.setString(2, username);
                psInsert.setString(3, content);
                int affectedRows = psInsert.executeUpdate();

                if (affectedRows > 0) {
                    try (ResultSet generatedKeys = psInsert.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            int commentId = generatedKeys.getInt(1);
                            // Now fetch the full comment object including the DB-generated timestamp
                            try (PreparedStatement psSelect = conn.prepareStatement(selectSql)) {
                                psSelect.setInt(1, commentId);
                                try (ResultSet rs = psSelect.executeQuery()) {
                                    if (rs.next()) {
                                        newComment = new Comment();
                                        newComment.setId(rs.getInt("id"));
                                        newComment.setProductId(rs.getInt("product_id"));
                                        newComment.setUsername(rs.getString("username"));
                                        newComment.setComment(rs.getString("comment"));
                                        newComment.setCreatedAt(rs.getTimestamp("created_at"));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newComment; // Will be null if insertion failed or fetching failed
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
//        Comment newC = CommentDao.insertComment(2, "ajaxUser", "Test comment from AJAX idea.");
//        if (newC != null) {
//            System.out.println("Inserted: " + newC);
//        } else {
//            System.out.println("Insertion failed.");
//        }
//
//        List<Comment> product2Comments = dao.getCommentsByProduct(2);
//        System.out.println("Comments for product 2: " + product2Comments);
//
//        dao.deleteComment(1); // Example: Assuming comment with ID 1 exists
    }
}