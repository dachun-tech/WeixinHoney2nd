<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            订单详情
        </h1>
    </section>
    <section class="content">
        <div class="container">
            <div class="row custom-info-row">
                <label class="col-sm-2">订单编号:</label>
                <label class="col-sm-4" id="nickname">
                <?php
                $no = "";
                $statusStr = ['已预订','进行中','已完成','已取消'];
                for($index = 0; $index < (10 - strlen($bookingDetail[0]->id."")); $index++)
                    $no = $no."0";
                $no = $no.$bookingDetail[0]->id;
                 echo $no;

                 $item = $bookingDetail[0];
                 ?></label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2" style="font-size: 24px;">订单信息:</label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">预订人:</label>
                <label class="col-sm-4" id="nickname"><?php echo $item->name; ?></label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">手机号:</label>
                <label class="col-sm-4" id="nickname"><?php echo $item->phone; ?></label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">预定信息:</label>
                <div class="col-sm-4" id="nickname">
                    <?php
                        $book_info = json_decode($item->book_info);
                        echo '<div>'.$item->site_name.'场馆</div>';
                        $old_room_id = 0;
                        foreach($book_info as $book){
                            $room_name = '';
                            foreach ($rooms as $room){
                                if($book->room_id == $room->id){
                                    $room_name = $room->room_name;
                                    break;
                                }
                            }
                            echo '<div style="width:50px;display:inline-block; text-align: center;">'.$room_name.'</div>';
                            echo $book->start_time.' ~ '.(explode(' ',$book->end_time)[1]);
                            $old_room_id = $book->room_id;
                            echo '<br>';
                        }
                    ?>
                </div>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">预定时间:</label>
                <label class="col-sm-4" id="site_name"><?php echo $item->start_time.' - '.(explode(' ',$item->end_time)[1]) ?></label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">应付金额:</label>
                <label class="col-sm-4" id="site_name"><?php echo $item->pay_cost +0; ?>元</label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">优惠金额:</label>
                <label class="col-sm-4" id="site_name"><?php echo $item->pay_honey+0; ?>元</label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">实付金额:</label>
                <label class="col-sm-4" id="site_name"><?php echo $item->pay_cost - $item->pay_honey; ?>元</label>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">订单状态:</label>
                <label class="col-sm-4" id="site_name"><?php echo $statusStr[$item->state]; ?></label>
            </div>
            <div id="tip" class="row custom-info-row">
                <label class="col-sm-2"> 评分:</label>
                <?php
//                var_dump($item);
                $index=0;
                if($item->point!=null){
                    for(; $index<$item->point;$index++){
                        ?>
                        <image src="<?php echo base_url().'assets/images/star_full.png';?>" style="width:20px;height:20px;"/>
                        <?php
                    }
                }
                for(;$index<5;$index++){
                    ?>
                    <image src="<?php echo base_url().'assets/images/star_blank.png';?>" style="width:20px;height:20px;"/>
                    <?php
                }
                ?>
            </div>
            <div class="row custom-info-row">
                <label class="col-sm-2">内容:</label>
                <label class="col-sm-2"><?php if($item->point!=null) echo $item->comment;?></label>
            </div>
            <div class="row custom-info-row">
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-offset-2 custom-course-control-view">
                    <input type="button" class="btn btn-primary" onclick="history.back();"
                           value="返回"/>
                </div>
            </div>
        </div>
    </section>
</div>


<!-- Course Management JS-->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/shop.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/jquery.qrcode.js" charset="utf-8"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/qrcode.js" charset="utf-8"></script>