<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            用户详情
        </h1>
    </section>
    <?php
    $userRole = array('无', '商家', '个人');
    $userState = array('未认证', '认证中', '认证通过', '认证未通过');
    $genderStr = array('男', '女');
    ?>
    <section class="content">
        <div class="container">
            <div class="row custom-info-row">
                <label class="col-sm-2">头像:</label>
                <image src="<?php echo $userDetail[0]->avatar; ?>" style="width:80px; height:80px; border-radius:50%;"/>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">昵称:</label>
                <label class="col-sm-4" id="nickname"><?php echo $userDetail[0]->nickname; ?></label>
            </div>
            <?php
            if ($userDetail[0]->role == 0) {

                echo '<div id="tip" class="row custom-info-row">
                        <label class="col-sm-2"> 认证状态:</label>
                        <label class="col-sm-4" id="state">' . $userState[$userDetail[0]->state] . '</label>
                    </div>';
            }
            ?>

            <div class="row custom-info-row">
                <label class="col-sm-2">运动项目:</label>
                <?php
                echo '<label class="col-sm-4" id="nickname">';
                $i = 0;
                foreach ($typeList as $item) {
                    if ($item->type == null || $item->type == '') continue;
                    if ($i != 0) echo ',';
                    echo $eventType[$item->type];
                    $i++;
                }
                if ($i == 0)
                    echo '没有运动项目';
                echo '</label>';
                ?>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">运动次数:</label>
                <?php
                echo '<label class="col-sm-4" id="nickname">';
                $i = 0;
                foreach ($typeList as $item) {
                    if ($i != 0) echo ',';
                    echo $item->count . '次';
                    $i++;
                }
                echo '</label>';
                ?>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">年龄:</label>
                <label class="col-sm-4"><?php echo $userDetail[0]->age; ?>岁</label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">性别:</label>
                <label class="col-sm-3"><?php echo ($userDetail[0]->gender == 0) ? '男' : '女'; ?></label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">个性签名:</label>
                <label class="col-sm-3"><?php echo $userDetail[0]->person_sign; ?></label>
                <div class="col-sm-4" id="datepicker-sign" style="width: 400px;"></div>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">名片被分享次数:</label>
                <label class="col-sm-3"><?php echo $userDetail[0]->shared_count; ?></label>
                <?php if($userDetail[0]->role == '1') {?>
                <label class="col-sm-2">钱包余额:</label>
                <label class="col-sm-4"><?php echo($walletInfo[0]->wallet); ?>元</label>
                <?php } ?>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">是不会员:</label>
                <label class="col-sm-3"><?php echo ($isMember[0]->state == null) ? '否' : '是'; ?></label>
                <?php if($userDetail[0]->role == '1') {?>
                <label class="col-sm-2">可提现:</label>
                <label class="col-sm-4"><?php echo($walletInfo[0]->withdraw); ?>元</label>
                <?php } ?>
            </div>
            <div id="tip" class="row custom-info-row">
                <label class="col-sm-2">禁用状态:</label>
                <label class="col-sm-3"><?php echo $userDetail[0]->forbidden ? '已禁用' : '未禁用'; ?></label>
                <?php if($userDetail[0]->role == '1') {?>
                <label class="col-sm-2">不可提现:</label>
                <label class="col-sm-4"><?php echo $walletInfo[0]->wallet - $walletInfo[0]->withdraw; ?>元</label>
                <?php } ?>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">现有蜂蜜量:</label>
                <label class="col-sm-3"><?php echo $userDetail[0]->honey . "ml"; ?></label>
                <?php if($userDetail[0]->role == '1') {?>
                <label class="col-sm-2">已提现:</label>
                <label class="col-sm-4"><?php echo $walletInfo[0]->total_withdraw; ?>元</label>
                <?php } ?>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">蜂蜜使用记录:</label>
                <div class="col-sm-6">
                    <table class="table table-bordered area-result-view">
                        <thead>
                        <tr style="background-color: lightslategrey;">
                            <th>用途</th>
                            <th>消耗蜂蜜</th>
                            <th>使用时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="content_tbl">
                        <?php
                        foreach ($exchange as $element) {
                            ?>
                            <tr>
                                <td>商城兑换</td>
                                <td><?php echo $element->cost; ?></td>
                                <td><?php echo $element->submit_time; ?></td>
                                <td><a href="<?php echo base_url() . 'exchangeDetail/' . $element->no; ?>">查看兑换</a></td>
                            </tr>
                            <?php
                        }
                        if ($userDetail[0]->role == 2) {
                            foreach ($event as $element) {
                                ?>
                                <tr>
                                    <td>创建活动</td>
                                    <td><?php echo $element->value; ?></td>
                                    <td><?php echo $element->reg_time; ?></td>
                                    <td><a href="<?php echo base_url() . 'eventDetail/' . $element->no; ?>">查看活动</a>
                                    </td>
                                </tr>
                                <?php
                            }
                        }
                        ?>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div>
            </div>

            <?php
            if ($userDetail[0]->role != 0) {
                ?>
                <div class="row custom-info-row">
                    <label class="col-sm-2">认证角色:</label>
                    <label class="col-sm-4"><?php echo $userRole[$userDetail[0]->role]; ?></label>
                </div>
                <div id="tip" class="row custom-info-row">
                    <label class="col-sm-2"> 认证状态:</label>
                    <label class="col-sm-4"><?= $userState[$userDetail[0]->state] ?></label>
                </div>
                <?php
            }
            ?>
            <?php
            if ($userDetail[0]->role == 2) {
                ?>
                <div class="row custom-info-row">
                    <label class="col-sm-2">真实姓名:</label>
                    <label class="col-sm-4"><?php echo $userDetail[0]->name; ?></label>
                </div>
                <?php
            }
            ?>
            <?php
            if ($userDetail[0]->role == 1) {
                ?>
                <!--<div class="row custom-info-row">
                    <label class="col-sm-2">商家名称:</label>
                    <label class="col-sm-4" id="nickname"><?php echo $userDetail[0]->site_name; ?></label>
                </div>-->
                <div class="row custom-info-row">
                    <label class="col-sm-2">馆主姓名:</label>
                    <label class="col-sm-4"><?php echo $userDetail[0]->name; ?></label>
                </div>
                <?php
            }
            ?>
            <div class="row custom-info-row">
                <label class="col-sm-2">联系电话:</label>
                <label class="col-sm-4"><?php echo $userDetail[0]->phone; ?></label>
            </div>
            <?php
            if ($userDetail[0]->role == 1) {
                ?>
                <!--                <div class="row custom-info-row">-->
                <!--                    <label class="col-sm-2">身份证号:</label>-->
                <!--                    <label class="col-sm-4" id="nickname">--><?php //echo $userDetail[0]->id_no;
                ?><!--</label>-->
                <!--                </div>-->

                <div class="row custom-info-row">
                    <label class="col-sm-2">身份证照片:</label>
                </div>
                <div class="row custom-info-row">
                    <img id="product_logo_image" src="<?php echo base_url() . 'uploads/' . $userDetail[0]->id_pic1; ?>"
                         class="online"
                         style="height: 200px; width:300px; padding: 20px; padding-bottom:2px;"">
                    <img id="product_logo_image" src="<?php echo base_url() . 'uploads/' . $userDetail[0]->id_pic2; ?>"
                         class="online"
                         style="height: 200px; width:300px; padding: 20px; padding-bottom:2px;"">
                </div>
                <?php
            } ?>
            <?php
            if ($userDetail[0]->role == 1) {
                ?>
                <div class="row custom-info-row">
                    <label class="col-sm-2">商家地址:</label>
                    <label class="col-sm-4"><?php echo $userDetail[0]->detail_address; ?></label>
                </div>
                <div class="row custom-info-row">
                    <label class="col-sm-2">营业执照:</label>
                    <img id="product_logo_image"
                         src="<?php echo base_url() . 'uploads/' . $userDetail[0]->allow_pic; ?>" class="online"
                         style="height: 200px; width:300px; padding: 20px; padding-bottom:2px;"">
                </div>
                <?php
            }
            ?>

        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-offset-2 custom-course-control-view">
                    <input type="button" class="btn btn-primary" onclick="location.href=baseURL+'usermanage';"
                           value="返回"/>
                </div>
            </div>
        </div>
    </section>
</div>


<script src="<?php echo base_url(); ?>assets/plugins/datepickk/datepickk.js"></script>
<!-- Course Management JS-->
<script>

    var now = new Date();
    var signItems = JSON.parse('<?= json_encode($signInfo);?>');
    var highlight = [];
    for (var i = 0; i < signItems.length; i++) {
        var item = signItems[i];
        var sign_month = item.sign_month.replace(/-/g,'/').substr(0,7);
        var sign_info = JSON.parse(item.sign_info);
        for(var j=0; j< sign_info.length; j++){
            var dateInfo = sign_info[j];
            if(dateInfo == 0) continue;
            highlight.push({
                start: new Date(sign_month+'/'+(j+1)+' 00:00:00'),
                end: new Date(sign_month+'/'+(j+1)+' 23:00:00'),
                backgroundColor: '#008fbf',
                color: '#fff'
            })
        }
    }
    var demoPicker = new Datepickk({
        container: document.querySelector('#datepicker-sign'),
        inline: true,
        range: true,
        lang: 'cn',
        highlight: highlight
    });


</script>
