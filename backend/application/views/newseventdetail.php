<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/dist/css/jquery.jcrop.css" type="text/css"/>-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/froala_editor.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/froala_style.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/code_view.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/colors.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/emoticons.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/image_manager.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/image.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/line_breaker.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/table.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/char_counter.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/video.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/fullscreen.css">-->
<!--<link rel="stylesheet" href="--><?php //echo base_url(); ?><!--assets/editor/css/plugins/file.css">-->
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">-->
<style type="text/css">
    .fr-box {
        width: 400px;
        left: 180px;
    }

    input {
        pointer-events: none;
        background: lightgrey;
        line-height: 1;
        vertical-align: middle !important;
        height: 25px !important;
        line-height: 25px !important;
        padding: 0 5px !important;
    }
</style>


<div class="content-wrapper" style="min-height: 100%">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <span class="head-selected"><?= $pageTitle; ?>
        </h1>
    </section>
    <section class="content" style="min-height: 800px;">
        <div class="container">
            <div>
                <?php echo form_open_multipart(base_url() . 'eventmanage/addEvent');
                $item = $eventDetail[0];
                ?>

                <div class="row form-inline">
                    <label> *封面图片 : </label>
                    <input hidden name="item_pics" value="<?= $item->pic ?>">
                    <div class="form-group text-center" style="padding: 0px 5px;">
                        <img class="img_preview" src="<?php echo base_url(); ?>assets/images/picture.png"
                             alt="user image" class="online" itemid="1"
                             style="height: 100px; width:150px;cursor:pointer;"><br>
                    </div>
                    <div class="form-group text-center" style="padding: 0px 5px;">
                        <img class="img_preview" src="<?php echo base_url(); ?>assets/images/picture.png"
                             alt="user image" class="online" itemid="2"
                             style="height: 100px; width:150px; cursor:pointer;"><br>
                    </div>
                    <div class="form-group text-center" style="padding: 0px 5px;">
                        <img class="img_preview" src="<?php echo base_url(); ?>assets/images/picture.png"
                             alt="user image" class="online" itemid="3"
                             style="height: 100px; width:150px; cursor:pointer;"><br>
                    </div>
                </div>

                <input type="hidden" name="id" value="<?= $item->id ?>"/>
                <div class="row form-inline">
                    <label> *赛事名称 : </label>
                    <div class="input-group margin">
                        <input name="name" type="text" class="form-control" placeholder="请输入"
                               value="<?= $item->eventName ?>" maxlength="10"
                               style="margin: 0 ; padding: 0px 20px;"/>
                    </div>
                </div>
                <div class="row form-inline">
                    <label> *报名费 : </label>
                    <div class="input-group margin">
                        <input name="cost" type="number" class="form-control" placeholder="请输入"
                               value="<?= $item->cost ?>" maxlength="10"
                               style="margin: 0 ; padding: 0px 20px; width: 80px; vertical-align: middle"/>
                        <label style="width: auto; line-height: 2.5"> 元 / 人 </label>
                    </div>
                </div>
                <div class="row form-inline">
                    <label> *比赛地点 : </label>
                    <div class="input-group margin">
                        <input name="address" type="text" class="form-control" placeholder="请输入"
                               value="<?= $item->detail_address ?>" maxlength="10"
                               style="margin: 0 ; padding: 0px 20px;"/>
                    </div>
                </div>
                <div class="row form-inline">
                    <label> *比赛时间 : </label>
                    <div class="input-group margin">
                        <input id="fromTime" name="fromTime" class="datepicker-inline form-control" size="16"
                               placeholder="请选择"
                               type="text" value="<?= $item->start_time; ?>" readonly="">
                    </div>
                </div>
                <div class="row form-inline">
                    <label> *报名截止时间 : </label>
                    <div class="input-group margin">
                        <input id="toTime" name="toTime" class="datepicker-inline form-control" size="16"
                               placeholder="请选择"
                               type="text" value="<?= $item->end_time ?>" readonly="">
                    </div>
                </div>
                <div class="row form-inline">
                    <label> *支付方式 : </label>
                    <div class="input-group margin">
                        <label style="width: auto" class="margin"><?= ($item->pay_type == '0') ? '线上支付' : '线下支付' ?>
                        </label>
                    </div>
                </div>

                <div class="row form-inline">
                    <label> *赛事类型 : </label>
                    <div class="input-group margin"><?= $eventType[$item->type]; ?>
                    </div>
                </div>

                <div class="row form-inline">
                    <label> *报名限制 : </label>
                    <div class="input-group margin"><?= $item->limit; ?>,<?= $item->person_limit; ?></div>
                </div>

                <div class="row form-inline">
                    <label> *赛事介绍 : </label>
                    <div class="input-group margin">
                        <div>
                            <?= $item->comment; ?>
                        </div>
                    </div>
                </div>

                <div class="row form-inline">
                    <label> *报名人数 : </label>
                    <div class="input-group margin">
                        <div>
                            <?= count($booking); ?>人
                        </div>
                    </div>
                </div>
                <div class="row custom-info-row">
                    <div class="col-sm-8">
                        <table class="table table-bordered area-result-view">
                            <thead>
                            <tr style="background-color: lightslategrey;">
                                <th>姓名</th>
                                <th>电话</th>
<!--                                <th>身份证号</th>-->
                                <th>支付方式</th>
                                <th>使用蜂蜜优惠</th>
                            </tr>
                            </thead>
                            <tbody id="content_tbl">
                            <?php
                            foreach ($booking as $item) {
                                ?>
                                <tr>
                                    <td><?php echo $item->name; ?></td>
                                    <td><?php echo $item->username; ?></td>
<!--                                    <td>--><?php //echo $item->id_no; ?><!--</td>-->
                                    <td><?php echo ($item->pay_type == 0) ? '线上已支付' : '线下已支付'; ?></td>
                                    <td><?php echo ($item->pay_honey == 0) ? '未使用' : $item->pay_honey; ?></td>
                                </tr>
                                <?php
                            }
                            ?>
                            </tbody>
                        </table>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="row form-inline">
                    <div class="row" style="padding-left: 200px;">
                        <div class="col-xs-12 col-sm-12 form-inline">
                            <a class="btn btn-default form-control"
                               href="<?php echo base_url(); ?>newseventmanage">
                                <span>返回赛事列表</span>
                            </a>
                        </div>
                    </div>
                </div>
                <?php echo "</form>" ?>
            </div>
        </div>

        <div class="col-md-3 col-md-offset-7" style="position: absolute; top: 125px">
            <?php
            $this->load->helper('form');
            $error = $this->session->flashdata('error');
            if ($error) {
                ?>
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('error'); ?>
                </div>
            <?php } ?>
            <?php
            $success = $this->session->flashdata('success');
            if ($success) {
                ?>
                <div class="alert alert-success alert-dismissable" style="display:none;">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <input type="text" value="<?php echo $this->session->flashdata('success'); ?>"
                           id="success_message" style="display:none;">
                </div>
            <?php } ?>

            <div class="row">
                <div class="col-md-12">
                    <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                </div>
            </div>
        </div>
    </section>
</div>
<div id="crop-image-panel" style="display: none;">
    <div style="display:none;overflow:hidden" id="div_avatar">
        <div style="overflow:hidden;float:left;" id="picture_original"><img alt="" src=""/></div>
        <div id="picture_200" style="float:left;margin-left:20px"></div>
        <input type="hidden" id="x1" name="x1" value="0"/>
        <input type="hidden" id="y1" name="y1" value="0"/>
        <input type="hidden" id="cw" name="cw" value="0"/>
        <input type="hidden" id="ch" name="ch" value="0"/>
        <input type="hidden" id="imgsrc" name="imgsrc"/>
        <input type="button" value="裁剪上传" id="btnCrop"/>
    </div>
</div>
<script src="<?php echo base_url(); ?>assets/dist/jquery.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/dist/jquery.ajaxfileupload.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/dist/jquery.jcrop.js" type="text/javascript"></script>
<script src="<?php echo base_url(); ?>assets/dist/avatarCutter.js" type="text/javascript"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/froala_editor.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/align.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/code_beautifier.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/code_view.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/colors.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/draggable.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/emoticons.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/font_size.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/font_family.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/image.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/file.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/image_manager.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/line_breaker.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/link.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/lists.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/paragraph_format.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/paragraph_style.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/video.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/table.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/url.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/entities.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/char_counter.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/inline_style.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/save.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/plugins/fullscreen.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/editor/js/languages/zh_cn.js"></script>
<script>
    $(function () {
        var pics = $('input[name="item_pics"]').val();
        if (pics != '') {
            pics = pics.split(',');
            for (var i = 0; i < pics.length; i++) {
                $('.img_preview[itemid="' + (i + 1) + '"]').attr('src', baseURL + 'uploads/'+pics[i]);
            }
        }
        $('textarea').froalaEditor({
            tabSpaces: 4,
            language: 'zh_cn',
            imageUploadURL: '<?php echo base_url();?>upload_image.php'
        })
    });
</script>
<script type="text/javascript">

    var jcrop_api;
    var type = 1;

    function getFileSize(fileName) {
        var byteSize = 0;
        console.log($("#" + fileName).val());
        if ($("#" + fileName)[0].files) {
            var byteSize = $("#" + fileName)[0].files[0].size;
        }
        byteSize = Math.ceil(byteSize / 1024) //KB
        return byteSize;//KB
    }

    function upload(filename, type, dest_width, dest_height) {
        var allowImgageType = ['jpg', 'jpeg', 'png'];
        var file = $('#' + filename).val();
        //获取大小
        var byteSize = getFileSize(filename);
        //获取后缀
        if (file.length > 0) {
            if (byteSize > 10000) {
                alert("上传的附件文件不能超过10M");
                $('#crop-image-panel').hide();
                return;
            }
            var pos = file.lastIndexOf(".");
            //截取点之后的字符串
            var ext = file.substring(pos + 1).toLowerCase();
            //console.log(ext);
            if ($.inArray(ext, allowImgageType) != -1) {
                ajaxFileUpload(filename, type, dest_width, dest_height);
            } else {
                alert("请选择jpg,jpeg,png类型的图片");
                $('#crop-image-panel').hide();
            }
        }
        else {
            alert("请选择jpg,jpeg,png类型的图片");
            $('#crop-image-panel').hide();
        }
    }

    function ajaxFileUpload(filename, type, dest_width, dest_height) {
        var url = '';
        if (type == 2) {
            url = '<?php echo base_url(); ?>goodsmanage/picUpload';
        }
        else {
            url = '<?php echo base_url(); ?>goodsmanage/logoUpload';
        }
        $.ajaxFileUpload({
            url: url, //用于文件上传的服务器端请求地址
            secureuri: false, //一般设置为false
            fileElementId: filename, //文件上传空间的id属性  <input type="file" id="file" name="file" />
            dataType: 'json', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
                console.log(data);
                //var json = eval('(' + data + ')');
                //alert(data);
                $("#picture_original>img").attr({src: data.src, width: data.width, height: data.height});
                $('#imgsrc').val(data.path);
                //alert(data.msg);

                //同时启动裁剪操作，触发裁剪框显示，让用户选择图片区域
                var cutter = new jQuery.UtrialAvatarCutter({
                        //主图片所在容器ID
                        content: "picture_original",
                        //缩略图配置,ID:所在容器ID;width,height:缩略图大小
                        purviews: [{id: "picture_200", width: dest_width, height: dest_height}, {
                            id: "picture_50",
                            width: 50,
                            height: 50
                        }, {id: "picture_30", width: 30, height: 30}],
                        //选择器默认大小
                        selector: {width: 750, height: 380},
                        cropattrs: {boxWidth: 750, boxHeight: 380},
                        aspectRatio: dest_width / dest_height,
                        showCoords: function (c) { //当裁剪框变动时，将左上角相对图片的X坐标与Y坐标 宽度以及高度
                            $("#x1").val(c.x);
                            $("#y1").val(c.y);
                            $("#cw").val(c.w);
                            $("#ch").val(c.h);
                        },
                    }
                );
                cutter.reload(data.src);
                $('#div_avatar').show();
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        })
        return false;
    }

    $('#btnCrop').click(function () {
        $.getJSON('<?php echo base_url(); ?>goodsmanage/picCrop', {
            x: $('#x1').val(),
            y: $('#y1').val(),
            w: $('#cw').val(),
            h: $('#ch').val(),
            src: $('#imgsrc').val()
        }, function (data) {
            console.log(data);
            if (type == 1) {
                $("#product_logo_image").attr("src", "<?php echo base_url(); ?>uploads/" + data.file);
                $("#product_logo_src").val(data.file);
            }
            else {
                $("#product_image").attr("src", "<?php echo base_url(); ?>uploads/" + data.file);
                $("#product_img_src").val(data.file);
            }

        });
        $('#crop-image-panel').hide();
        return false;
    });

</script>
<script>

    $(function () {
        $(".datepicker-inline").datetimepicker({
            format: 'yyyy-mm-dd hh:ii'
        });
    });

    function cleanTime() {
        $("#fromTime").val("");
        console.log("here");
        $("#toTime").val("");
    }
</script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/product_manage/goods.js"
        charset="utf-8"></script>

