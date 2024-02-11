<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <h1>게시판</h1>

    <ul>
    <%-- Java 코드를 사용하여 데이터베이스에서 게시글을 가져와서 HTML에 삽입 --%>
    <% 
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // 데이터베이스 연결
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/git";
            String username = "freeman";
            String password = "suny10suny10**";
            connection = DriverManager.getConnection(url, username, password);

            // SQL 쿼리 실행
            String sql = "SELECT * FROM Gitboard";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            // 결과 출력
            while (resultSet.next()) {
                int number = resultSet.getInt("number");
                String contents = resultSet.getString("contents");
                String date = resultSet.getString("date");

                out.println("<li>");
                out.println("Number: " + number + "<br>");
                out.println("Contents: " + contents + "<br>");
                out.println("Date: " + date + "<br>");
                out.println("</li>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 연결 해제
            try { resultSet.close(); } catch (Exception e) { e.printStackTrace(); }
            try { statement.close(); } catch (Exception e) { e.printStackTrace(); }
            try { connection.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>
    </ul>
</body>
</html>
