<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            预订管理
        </h1>
        <input id="pageTitle" value="<?php echo $pageTitle ?>" type="hidden">
    </section>
    <section class="content" style="min-height: 800px;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <form action="<?php echo base_url(); ?>bookingListingByFilter" method="POST" id="searchList">
                        <div class="col-xs-2 col-sm-4 form-inline">
                            <div class="form-group">
                                <select class="form-control" id="searchStatus" name="searchStatus">
                                    <option value="0"<?php if ($searchStatus == 0) echo ' selected'; ?>>订单编号</option>
                                    <option value="1"<?php if ($searchStatus == 1) echo ' selected'; ?>>订场人姓名</option>
                                    <option value="2"<?php if ($searchStatus == 2) echo ' selected'; ?>>订场人电话</option>
                                    <option value="3"<?php if ($searchStatus == 3) echo ' selected'; ?>>场馆名称</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" id="searchName" name="searchName"
                                       value="<?php echo $searchText == 'all' ? '' : $searchText; ?>"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-1 form-inline">
                            <div class="form-group">
                                <select class="form-control" id="searchType" name="searchType">
                                    <option value="100"<?php if ($searchType == 100) echo ' selected'; ?>>活动类型</option>
                                    <?php
                                    for ($index = 0; $index < count($eventType); $index++) {
                                        ?>
                                        <option value="<?php echo $index; ?>" <?php if ($searchType == $index) echo ' selected'; ?>><?php echo $eventType[$index]; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-1 form-inline">
                            <div class="form-group">
                                <select class="form-control" id="searchState" name="searchState">
                                    <option value="10"<?php if ($searchState == 10) echo ' selected'; ?>>活动状态</option>
                                    <option value="0"<?php if ($searchState == 0) echo ' selected'; ?>>进行中</option>
                                    <option value="1"<?php if ($searchState == 1) echo ' selected'; ?>>已完成</option>
                                    <option value="2"<?php if ($searchState == 2) echo ' selected'; ?>>已取消</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 form-inline" style="margin-top: 10px;">
                            <div class="form-group">
                                <span> 预订时间 </span>
                                <input id="fromTime" name="searchStart" class="datepicker-inline form-control" size="16"
                                       type="text" value="<?php echo $searchStart; ?>" readonly="">

                                <span> 至 </span>
                                <input id="toTime" name="searchEnd" class="datepicker-inline form-control" size="16"
                                       type="text" value="<?php echo $searchEnd; ?>" readonly="">
                                <input type="button" class="btn btn-primary searchList"
                                       onclick="cleanTime()" value="清除">
                                </input>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-1 form-inline">
                            <div class="form-group area-search-control-view">
                                <input type="submit" class="btn btn-primary searchList" value="查询">
                                </input>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-1 form-inline">
                            <div class="form-group area-search-control-view">
                                <input type="button" class="btn btn-primary searchList"
                                       onclick="exportTable()" value="导出">
                                </input>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <table class="table area-result-view table-bordered table-hover">
                        <thead>
                        <tr style="background-color: lightslategrey;">
                            <th width="">订单号</th>
                            <th>预订人</th>
                            <th>手机号</th>
                            <th>预订信息</th>
                            <th>金额</th>
                            <th>预订状态</th>
                            <th>下单时间</th>
                            <th width="">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        if (!empty($creation_name)) {
                            $pay = array('线下支付', '线上支付');
                            $bookingState = array('进行中', '已完成', '已取消');
                            foreach ($bookingList as $record) {
                                $no = "";
                                for ($index = 0; $index < (10 - strlen($record->id . "")); $index++)
                                    $no = $no . "0";
                                $no = $no . $record->id;
                                ?>
                                <tr>
                                    <td><?php echo $no; ?></td>
                                    <td><?php echo $record->name; ?></td>
                                    <td><?php echo $record->phone; ?></td>
                                    <td><?php echo $pay[$record->pay_type]; ?></td>
                                    <td><?php echo($record->reg_num * $record->cost); ?></td>
                                    <td><?php echo $bookingState[$record->state]; ?></td>
                                    <td><?php echo $record->submit_time; ?></td>
                                    <td class="text-center">
                                        <a href="<?php echo base_url() . 'bookingDetail/' . $record->id; ?>">
                                            查看 &nbsp;
                                        </a>
                                    </td>
                                </tr>
                                <?php
                                next($creation_name);
                            }
                        }
                        ?>
                        </tbody>
                    </table>
                    <div class="clearfix">
                        <?php echo $this->pagination->create_links(); ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>
<script>

    $(function () {
        $(".datepicker-inline").datepicker({
            format: 'yyyy-mm-dd'
        });
    });

    function cleanTime() {
        $("#fromTime").val("");
        console.log("here");
        $("#toTime").val("");
    }
</script>

