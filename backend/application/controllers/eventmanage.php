<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/basecontroller.php';

/**
 * Class : Shop (ShopController)
 * Area Class to control all shop related operations.
 * @author : The jin hu
 * @version : 1.0
 * @since : 12 August 2017
 */
class eventmanage extends basecontroller
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * This function used to load the first screen of the event
     */
    public function index($type = 1)
    {
        $sData = $this->session->userdata('event_infos');
        $searchType = 100;
        $searchName = '';
        $searchRole = 10;
        $searchState = 10;
        $searchStatus = null;
        $searchStart = '';
        $searchEnd = '';
        $fromTime = '';
        $toTime = '';
        if ($sData) {
            $searchType = $sData['searchType'];
            $searchName = $sData['searchName'];
            $searchRole = $sData['searchRole'];
            $searchState = $sData['searchState'];
            $searchStatus = $sData['searchStatus'];
            $searchStart = $sData['searchStart'];
            $searchEnd = $sData['searchEnd'];
        }
        $this->eventCollectListing($searchStatus, $searchName, $searchType,
            $searchRole, $searchState, $searchStart, $searchEnd, $type);
    }

    /**
     * This function is used to load the event list
     */
    function eventCollectListing($searchStatus = null, $searchName = '', $searchType = 100,
                                 $searchRole = 10, $searchState = 10, $searchStart = '', $searchEnd = '', $type = 1)
    {
        $this->global['pageTitle'] = "活动管理";
        $this->global['pageType'] = 'event';
        if (intval($type) == 0) {
            $this->global['pageTitle'] = "赛事管理";
            $this->global['pageType'] = 'news';
        }
        if ($searchName == 'ALL') $searchName = '';
        $count = $this->event_model->eventListingCount($searchStatus, $searchName, $searchType,
            $searchRole, $searchState, $searchStart, $searchEnd, $type);
        $returns = $this->paginationCompress("eventmanage/", $count, 10);
        $data['eventList'] = $this->event_model->eventListing($searchStatus, $searchName, $searchType,
            $searchRole, $searchState, $searchStart, $searchEnd, $returns['page'], $returns['segment'], $type);
        $this->global['searchStatus'] = $searchStatus;
        $this->global['searchText'] = $searchName;
        $this->global['searchRole'] = $searchRole;
        $this->global['searchState'] = $searchState;
        $this->global['searchType'] = $searchType;
        $this->global['searchStart'] = $searchStart;
        $this->global['searchEnd'] = $searchEnd;
        $this->loadViews("eventmanage", $this->global, $data, NULL);
    }

    /**
     * This function is used to load the event list by search
     */
    function eventListingByFilter($type = 1)
    {
        $searchStatus = $this->input->post('searchStatus');
        $searchName = $this->input->post('searchName');
        $searchRole = $this->input->post('searchRole');
        $searchState = $this->input->post('searchState');
        $searchType = $this->input->post('searchType');
        $searchStart = $this->input->post('searchStart');
        $searchEnd = $this->input->post('searchEnd');
        $this->session->set_userdata('event_infos', array(
            'searchType' => $searchType,
            'searchName' => $searchName,
            'searchRole' => $searchRole,
            'searchState' => $searchState,
            'searchStatus' => $searchStatus,
            'searchStart' => $searchStart,
            'searchEnd' => $searchEnd,
        ));
        $this->eventCollectListing($searchStatus, $searchName, $searchType, $searchRole, $searchState, $searchStart, $searchEnd, $type);
    }

    /**
     * This function is used to load the event list by search
     */
    function deleteEvent()
    {
        $eventId = $this->input->post('eventId');
        $result = $this->event_model->deleteEvent($eventId);
        if ($result) {
            $this->session->set_flashdata('success', '删除成功.');
            echo(json_encode(array('status' => TRUE)));
        } else {
            $this->session->set_flashdata('error', '删除失败.');
            echo(json_encode(array('status' => FALSE)));
        }
    }

    /**
     * This function is used to load the event list by search
     */
    function addItem()
    {
        $this->global['pageTitle'] = "新增赛事";
        $this->loadViews("newseventadd", $this->global, NULL);
    }

    /**
     * This function is used to load the event list by search
     */
    function addEvent()
    {
        $info['name'] = $this->input->post('name');
        $info['type'] = $this->input->post('eventtype');
        $info['cost'] = $this->input->post('cost');
        $info['detail_address'] = $this->input->post('address');
        $info['start_time'] = $this->input->post('fromTime');
        $info['end_time'] = $this->input->post('toTime');
        $info['pay_type'] = $this->input->post('payMode');
        $info['limit'] = $this->input->post('limit1');
        $info['person_limit'] = $this->input->post('limit2');
        $info['comment'] = $this->input->post('comment');
        $info['pic'] = $this->input->post('item_pics');
        $info['reg_time'] = date("Y-m-d H:i:s");
        $error = 0;

        $id = $this->input->post('id');
        if ($id == '') {
            $good = $this->db->query("select count(id) as amount from event where name='" . $info['name'] . "'")->result();
            if ($good[0]->amount > 0) {
                $this->global['error_name'] = "赛事名称重复";
                $error++;
            }
        }
        if ($info['name'] == '') {
            $this->global['error_name'] = "请填写赛事名称";
            $error++;
        }
        if ($info['cost'] == '') {
            $this->global['error_cost'] = "请填写报名费";
            $error++;
        }
        $cost = $info['cost'];
        if ($cost != floor($info['cost']) || $cost < 0) {
            $this->global['error_cost'] = "消耗蜂蜜必须是整数";
            $error++;
        }
        if ($info['detail_address'] == '') {
            $this->global['error_address'] = "请填写比赛地点";
            $error++;
        }
        if ($info['start_time'] == '') {
            $this->global['error_fromTime'] = "请选择比赛时间";
            $error++;
        }
        if ($info['end_time'] == '') {
            $this->global['error_toTime'] = "请选择报名截止时间";
            $error++;
        }
        if ($info['pay_type'] == '') {
            $this->global['error_payMode'] = "请选择支付方式";
            $error++;
        }
        if ($info['limit'] == '') {
            $this->global['error_limit1'] = "请选择报名限制";
            $error++;
        }
        $id = $this->event_model->add($info, $id);
        $upload_root = "uploads/events/";
        $db_root = 'events/';
        $config['upload_path'] = $upload_root;
        $config['allowed_types'] = '*';
        $this->load->library('upload', $config);

        $fields = ['img1', 'img2', 'img3', 'ans_img2', 'ans_img3', 'ans_img4'];
        $imgs = '';
        $cnt = 0;
        for ($j = 0; $j < 3; $j++) {
            $type = explode('.', $_FILES[$fields[$j]]["name"]);
            $type = $type[count($type) - 1];
            if ($_FILES[$fields[$j]]["name"] != '') {
                //image uploading
                $config['upload_path'] = $upload_root;
                $config['file_name'] = $id . '_' . $fields[$j] . '.' . $type;
                $this->upload->initialize($config, TRUE);
                if (file_exists($upload_root . $config['file_name']))
                    unlink($upload_root . $config['file_name']);
                if ($this->upload->do_upload($fields[$j])) {
                    $cnt++;
                    if ($cnt != 1) $imgs .= ',';
                    $data = $this->upload->data();
                    $imgs .= $db_root . $config['file_name'];
                } else {///show error message
                    $ret['data'] = $this->upload->display_errors();
                    $ret['status'] = 'fail';
                    echo json_encode($ret);
                    return;
                }
            }
        }
        if ($cnt > 0) $info['pic'] = $imgs;

        if ($info['pic'] == '') {
            $this->global['error_pic'] = "请选择图片";
            $error++;
        }

        if ($error == 0) {
            $info['owner'] = 0;
            $info['organizer_id'] = 0;
            $result = $this->event_model->add($info, $id);
            if ($result != null) {
                redirect("newseventmanage");
            } else {
                redirect("usermanage");
            }
        } else {
            $this->event_model->deleteEvent($id);
            $this->global['item_name'] = $info['name'];
            $this->global['item_pics'] = $info['pic'];
            $this->global['item_cost'] = $info['cost'];
            $this->global['item_address'] = $info['detail_address'];
            $this->global['item_fromTime'] = $info['start_time'];
            $this->global['item_toTime'] = $info['end_time'];
            $this->global['item_payMode'] = $info['pay_type'];
            $this->global['comment'] = $info['comment'];
            $this->addItem();
        }
    }


    /**
     * This function is used to show the detail of event with eventId
     */
    function showEventDetail($eventId)
    {
        $eventDetail = $this->event_model->getEventDetailById($eventId);
        $data['eventDetail'] = $eventDetail;

        $userId = $this->event_model->getOrganizerId($eventId);
        $this->load->model('user_model');
        $userRole = $this->user_model->getRoleById($userId[0]->organizer_id);
        if ($userRole->role == 2) {
            $this->load->model('member_state_model');
            $data['member_state'] = $this->member_state_model->getStateById($userId[0]->organizer_id);
        }
        $this->load->model('booking_model');
        $data['booking'] = $this->booking_model->getBookingDetailByEvent($eventId);
        $favourite = $this->db->query("select count(no) as favourite_amount from favourite_event where event_id=" . $eventId)->result();
        $data['favourite_amount'] = $favourite[0]->favourite_amount;
        $this->global['pageTitle'] = '活动详情';
        $this->loadViews("eventdetail", $this->global, $data, NULL);
    }

    /**
     * This function is used to show the detail of event with eventId
     */
    function showNewsEventDetail($eventId)
    {
        $eventDetail = $this->event_model->getEventDetailById($eventId);
        $data['eventDetail'] = $eventDetail;

        $userId = $this->event_model->getOrganizerId($eventId);
        $this->load->model('user_model');
        $userRole = $this->user_model->getRoleById($userId[0]->organizer_id);
        if ($userRole->role == 2) {
            $this->load->model('member_state_model');
            $data['member_state'] = $this->member_state_model->getStateById($userId[0]->organizer_id);
        }
        $this->load->model('booking_model');
        $data['booking'] = $this->booking_model->getBookingDetailByEvent($eventId);
        $favourite = $this->db->query("select count(no) as favourite_amount from favourite_event where event_id=" . $eventId)->result();
        $data['favourite_amount'] = $favourite[0]->favourite_amount;
        $this->global['pageTitle'] = '赛事详情';
        $this->loadViews("newseventdetail", $this->global, $data, NULL);
    }

    function pageNotFound()
    {
        $this->global['pageTitle'] = '蜂体 : 404 - Page Not Found';

        $this->loadViews("404", $this->global, NULL, NULL);
    }
}

/* End of file eventmanage.php */
/* Location: .application/controllers/eventmanage.php */


?>