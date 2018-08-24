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
        if ($sData) {
            $searchType = $sData['searchType'];
            $searchName = $sData['searchName'];
            $searchPay = $sData['searchPay'];
            $searchState = $sData['searchState'];
            $searchStatus = $sData['searchStatus'];
        }
        $this->bookingCollectListing($searchStatus, $searchName, $searchType,  $searchState, $searchPay);
    }

    /**
     * This function is used to load the booking list
     */
    function bookingCollectListing($searchStatus = null, $searchName = '', $searchType = 100,  $searchState = 10, $searchPay = 10)
    {
        $this->global['pageTitle'] = "蜂约订单";
        if ($searchName == 'ALL') $searchName = '';
        $count = $this->booking_model->bookingListingCount($searchStatus, $searchName, $searchType, $searchState, $searchPay);
        $returns = $this->paginationCompress("bookingmanage/", $count, 10);
        $data['bookingList'] = $this->booking_model->bookingListing($searchStatus, $searchName, $searchType, $searchState, $searchPay, $returns['page'], $returns['segment']);
        $data['creation_name'] = $this->booking_model->getCreationName($searchStatus, $searchName, $searchType, $searchState, $searchPay, $returns['page'], $returns['segment']);
        $this->global['searchStatus'] = $searchStatus;
        $this->global['searchText'] = $searchName;
        $this->global['searchPay'] = $searchPay;
        $this->global['searchState'] = $searchState;
        $this->global['searchType'] = $searchType;
        $this->global['pageType'] = 'booking';
        $this->loadViews("bookingmanage", $this->global, $data, NULL);
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
        $this->session->set_userdata('booking_infos', array(
        'searchType'=>$searchType,
        'searchName'=>$searchName,
        'searchPay'=>$searchPay,
        'searchState'=>$searchState,
        'searchStatus'=>$searchStatus,
        ));
        $this->bookingCollectListing($searchStatus, $searchName, $searchType, $searchState, $searchPay);
    }

    /**
     * This function is used to load the booking list by search
     */
    function deleteBooking()
    {
        $bookingId = $this->input->post('bookingId');
        $result = $this->booking_model->deletebooking($bookingId);
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
        $data['bookingDetail'] = $this->booking_model->getBookingById($bookingId);
        $eventId = $this->booking_model->getEventId($bookingId);
        $data['eventDetail'] = $this->event_model->getEventById($eventId->event_id);
        $boss = $this->event_model->getOrganizerId($eventId->event_id);
        $user = $this->booking_model->getUserId($bookingId);
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