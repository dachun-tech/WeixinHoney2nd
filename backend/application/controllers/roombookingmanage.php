<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/basecontroller.php';

/**
 * Class : Shop (ShopController)
 * Area Class to control all shop related operations.
 * @author : The jin hu
 * @version : 1.0
 * @since : 12 August 2017
 */
class roombookingmanage extends basecontroller
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('roombooking_model');
        $this->load->model('boss_model');
        $this->load->model('user_model');
        $this->isLoggedIn();
    }

    /**
     * This function used to load the first screen of the booking
     */
    public function index()
    {
        $sData = $this->session->userdata('booking_infos');
        $searchType = 100;
        $searchName = '';
        $searchPay = 10;
        $searchState = 10;
        $searchStatus = null;
        $searchStart = '';
        $searchEnd = '';
        if ($sData) {
            $searchType = $sData['searchType'];
            $searchName = $sData['searchName'];
            $searchPay = $sData['searchPay'];
            $searchState = $sData['searchState'];
            $searchStatus = $sData['searchStatus'];
            $searchStart = $sData['startTime'];
            $searchEnd = $sData['endTime'];
        }
        $this->bookingCollectListing($searchStatus, $searchName, $searchType,  $searchState, $searchPay, $searchStart, $searchEnd);
    }

    /**
     * This function is used to load the booking list
     */
    function bookingCollectListing($searchStatus = null, $searchName = '', $searchType = 100,  $searchState = 10, $searchPay = 10, $searchStart='', $searchEnd='')
    {
        $this->global['pageTitle'] = "预订订单";
        if ($searchName == 'ALL') $searchName = '';
        $count = $this->roombooking_model->bookingListingCount($searchStatus, $searchName, $searchType, $searchState, $searchPay, $searchStart, $searchEnd);
        $returns = $this->paginationCompress("bookingmanage/", $count, 10);
        $data['bookingList'] = $this->roombooking_model->bookingListing($searchStatus, $searchName, $searchType, $searchState, $searchPay, $searchStart, $searchEnd, $returns['page'], $returns['segment']);
        $data['creation_name'] = $this->roombooking_model->getCreationName($searchStatus, $searchName, $searchType, $searchState, $searchPay, $searchStart, $searchEnd, $returns['page'], $returns['segment']);
        $this->global['searchStatus'] = $searchStatus;
        $this->global['searchText'] = $searchName;
        $this->global['searchPay'] = $searchPay;
        $this->global['searchState'] = $searchState;
        $this->global['searchType'] = $searchType;
        $this->global['searchStart'] = $searchStart;
        $this->global['searchEnd'] = $searchEnd;
        $this->global['pageType'] = 'roombooking';
        $this->loadViews("roombookingmanage", $this->global, $data, NULL);
    }

    /**
     * This function is used to load the booking list by search
     */
    function bookingListingByFilter()
    {
        $searchStatus = $this->input->post('searchStatus');
        $searchName = $this->input->post('searchName');
        $searchPay = $this->input->post('searchPay');
        $searchState = $this->input->post('searchState');
        $searchType = $this->input->post('searchType');
        $searchStart = $this->input->post('fromTime');
        $searchEnd = $this->input->post('toTime');
        $this->session->set_userdata('booking_infos', array(
        'searchType'=>$searchType,
        'searchName'=>$searchName,
        'searchPay'=>$searchPay,
        'searchState'=>$searchState,
        'searchStatus'=>$searchStatus,
        'searchStart'=>$searchStart,
        'searchEnd'=>$searchEnd
        ));
        $this->bookingCollectListing($searchStatus, $searchName, $searchType, $searchState, $searchPay, $searchStart, $searchEnd);
    }

    /**
     * This function is used to load the booking list by search
     */
    function deleteBooking()
    {
        $bookingId = $this->input->post('bookingId');
        $result = $this->roombooking_model->deletebooking($bookingId);
        if ($result) {
            $this->session->set_flashdata('success', '删除成功.');
            echo(json_encode(array('status' => TRUE)));
        } else {
            $this->session->set_flashdata('error', '删除失败.');
            echo(json_encode(array('status' => FALSE)));
        }
    }
/**
     * This function is used to show the detail of booking with bookingId
     */
    function showBookingDetail($bookingId)
    {
        $data['bookingDetail'] = $this->roombooking_model->getBookingById($bookingId);
        $eventId = $this->roombooking_model->getEventId($bookingId);
        $data['eventDetail'] = $this->event_model->getEventById($eventId->event_id);
        $boss = $this->event_model->getOrganizerId($eventId->event_id);
        $user = $this->roombooking_model->getUserId($bookingId);
        $data['rating'] = $this->rating_model->getRatingContentById($user->user_id, $boss[0]->organizer_id);
        $this->global['pageTitle'] = '活动详情';
        $this->loadViews("bookingdetail", $this->global, $data, NULL);
    }
    function pageNotFound()
    {
        $this->global['pageTitle'] = '蜂体 : 404 - Page Not Found';

        $this->loadViews("404", $this->global, NULL, NULL);
    }
}

/* End of file bookingmanage.php */
/* Location: .application/controllers/bookingmanage.php */


?>