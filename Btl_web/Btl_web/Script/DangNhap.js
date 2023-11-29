function validateForm(event) {
    event.preventDefault(); // Ngăn chặn việc gửi form

    // Lấy giá trị username và password từ các ô input
    var usernameInput = document.getElementById('username');
    var username = usernameInput.value;
    var passwordInput = document.getElementById('password');
    var password = passwordInput.value;

    // Kiểm tra lỗi trống
    if (username.trim() === '') {
        document.getElementById('usernameError').textContent = 'Vui lòng nhập tên đăng nhập.';
        return;
    }

    if (password.trim() === '') {
        document.getElementById('passwordError').textContent = 'Vui lòng nhập mật khẩu.';
        return;
    }

    // Gửi form nếu không có lỗi
    document.getElementById('loginForm').submit();
}