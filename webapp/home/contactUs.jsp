<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us</title>
    <!-- bulma cdn -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css" />
    <!-- google map cdn -->
    <link
        href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i"
        rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" />
    <!-- font cdn -->
    <link href="https://fonts.googleapis.com/css?family=Sen&display=swap" rel="stylesheet" />
    <script src="../js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <link rel="stylesheet" href="../css/ContactUs.css" />
</head>

<body>
    <div id="loadHeader"></div>
    <section>
        <div class="hero" id="section-hero">
            <section class="contact-us">
                <div class="container">
                    <div class="col-md-6" id="section-hero-content">
                        <div class="row">
                            <h2 class="subtitle">Message</h2>
                        </div>
                        <form id="contact" data-email="whitelies106@gmail.com"
                            action="https://script.google.com/macros/s/AKfycbyexFiCi6i6NcysWyIHfwo89HRGaO9yLjS9TWAx/exec"
                            method="post" class="gform">
                            <div class="col-md-6" id="nep">
                                <fieldset>
                                    <input name="name" type="text" class="input is-primary" id="name"
                                        placeholder="Your name..." required="" />
                                </fieldset>
                                <fieldset>
                                    <input name="email" type="text" class="input is-primary" id="email"
                                        placeholder="Your email..." required="" />
                                </fieldset>
                                <fieldset ">
                                    <input name=" phone" type="text" class="input is-primary id=" phone"
                                    placeholder="Your phone..." required="" />
                                </fieldset>
                            </div>
                            <div class="col-md-6" id="ms">
                                <fieldset id="taria">
                                    <textarea class="textarea is-primary" placeholder="Primary textarea"></textarea>
                                </fieldset>
                                <fieldset>
                                    <button type="submit" id="form-submit" class="button is-danger">Send
                                        Message</button>
                                </fieldset>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
        <div class="section-heading contact-info" id="section-heading">
            <h2 class="subtitle">Contact Info</h2>
            <p>
                Pellentesque nec orci in erat venenatis viverra. Vivamus in lorem et leo feugiat ullamcorper. Donec
                volutpat fermentum erat non aliquet. Cras fermentum, risus a blandit sodales,
                erat turpis eleifend lacus, venenatis mollis leo lorem vel eros. Quisque et sem tempus, feugiat urna
                iaculis, tempor metus.<br /><br /><em>30 Raffles Ave, <br />Singapore 039803</em>
            </p>
        </div>

        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2058134411113!2d127.02209711511125!3d37.503063679809834!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15aee9ab0cb%3A0x31793fc63e0cf9d3!2z67mE7Yq47Lqg7ZSE!5e0!3m2!1sen!2skr!4v1583644855135!5m2!1sen!2skr"
            width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>

        <!-- spread sheet 필수 -->

        <div id="loadFooter"></div>

        <script data-cfasync="false" type="text/javascript"
            src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js"></script>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../js/google-apps-script.js"></script>
<script src="../js/ContactUs.js"></script>

</html>