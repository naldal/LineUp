<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
        <!-- import -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/js/all.min.js"></script>
        <link rel="stylesheet" href="../css/loginForm.css" />
        <style></style>
    </head>

    <div>
        <div id="loadHeader"></div>
        <section class="hero is-fullheight">
            <div class="hero-body">
                <div class="container">
                    <div class="columns is-centered">
                        <div class="column is-5-tablet is-4-desktop is-3-widescreen" id="formation">
                            <form id="loginForm" name="loginForm" class="box">
                                <div class="field">
                                    <label for="" class="label">Email</label>
                                    <div class="control has-icons-left">
                                        <input type="text" name="id" id="id" placeholder="e.g. haminsong@gmail.com" class="input" required />
                                        <span class="icon is-small is-left">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                    </div>
                                </div>
                                <div id="idDiv"></div>
                                <!-- //Email -->

                                <div class="field">
                                    <label class="label">Password</label>
                                    <div class="control has-icons-left">
                                        <input type="password" name="pwd" id="pwd" placeholder="*******" class="input" required />
                                        <span class="icon is-small is-left">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                    </div>
                                </div>
                                <div id="pwdDiv"></div><br>
                                <div id="loginResultDiv"></div>
                                <!-- //Password -->

                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <!-- //Remember me -->

                                <div class="field">
                                    <button type="button" id="submit" class="button is-success">
                                        Login
                                    </button>
                                </div>
                                <!-- //Login btn -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div id="loadFooter"></div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/loginForm.js"></script>
</html>
