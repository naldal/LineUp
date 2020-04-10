<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>예약창</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean" rel="stylesheet" />
        <link rel="stylesheet" href="../css/reservation_form.css" />
    </head>
    <body>
        <section class="section">
            <div class="container">
                <div class="column is-center">
                    <form class="box" style="width: 40%;" action="">
                        <div class="field">
                            <label for="" class="label">이름</label>
                            <span>송하민</span>
                        </div>
                        <div class="field">
                            <label for="" class="label">전화번호</label>
                            <input type="text" class="input is-rounded" value="010-6356-8057" />
                        </div>
                        <div id="re" class="field">
                            <label for="" class="label">인원수</label>
                            <div class="select">
                                <select name="howmany">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11+</option>
                                </select>
                            </div>
                            <div id="ab">
                                <button class="button is-warning">예약하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>
