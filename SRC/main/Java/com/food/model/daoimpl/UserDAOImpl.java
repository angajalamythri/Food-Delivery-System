package com.food.daoimpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.UserDAO;
import com.food.model.User;
import com.food.util.DBConnection;

public class UserDAOImpl implements UserDAO {

    private Connection con;

    public UserDAOImpl() {
    	con = DBConnection.getConnection();
    }

    // ADD USER

    @Override
    public boolean addUser(User user) {

        String sql =
                "INSERT INTO User " +
                "(Username, Password, Email, Address, Role) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1,
                    user.getUsername());

            pstmt.setString(2,
                    user.getPassword());

            pstmt.setString(3,
                    user.getEmail());

            pstmt.setString(4,
                    user.getAddress());

            pstmt.setString(5,
                    user.getRole());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // GET USER BY ID

    @Override
    public User getUserById(int userId) {

        User user = null;

        String sql =
                "SELECT * FROM User WHERE UserID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1, userId);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                user = extractUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // GET USER BY USERNAME

    @Override
    public User getUserByUsername(
            String username) {

        User user = null;

        String sql =
                "SELECT * FROM User " +
                "WHERE Username=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1,
                    username);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                user = extractUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // GET ALL USERS

    @Override
    public List<User> getAllUsers() {

        List<User> users =
                new ArrayList<>();

        String sql =
                "SELECT * FROM User";

        try {

            Statement stmt =
                    con.createStatement();

            ResultSet rs =
                    stmt.executeQuery(sql);

            while (rs.next()) {

                users.add(
                        extractUser(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    // UPDATE USER

    @Override
    public boolean updateUser(User user) {

        String sql =
                "UPDATE User SET " +
                "Username=?, Password=?, Email=?, " +
                "Address=?, Role=? " +
                "WHERE UserID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1,
                    user.getUsername());

            pstmt.setString(2,
                    user.getPassword());

            pstmt.setString(3,
                    user.getEmail());

            pstmt.setString(4,
                    user.getAddress());

            pstmt.setString(5,
                    user.getRole());

            pstmt.setInt(6,
                    user.getUserId());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // DELETE USER

    @Override
    public boolean deleteUser(int userId) {

        String sql =
                "DELETE FROM User WHERE UserID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    userId);

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // COMMON METHOD

    private User extractUser(ResultSet rs)
            throws SQLException {

        User user = new User();

        user.setUserId(
                rs.getInt("UserID"));

        user.setUsername(
                rs.getString("Username"));

        user.setPassword(
                rs.getString("Password"));

        user.setEmail(
                rs.getString("Email"));

        user.setAddress(
                rs.getString("Address"));

        user.setRole(
                rs.getString("Role"));

        Timestamp created =
                rs.getTimestamp(
                        "CreatedDate");

        if (created != null) {

            user.setCreatedDate(
                    created.toLocalDateTime());
        }

        Timestamp lastLogin =
                rs.getTimestamp(
                        "LastLoginDate");

        if (lastLogin != null) {

            user.setLastLoginDate(
                    lastLogin.toLocalDateTime());
        }

        return user;
    }
}