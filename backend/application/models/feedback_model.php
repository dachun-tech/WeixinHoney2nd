<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class feedback_model extends CI_Model
{

    /**
    *This is function to get feedbacks of event
    */
    function getFeedbacks($event_id){
        $this->db->select("user.avatar, user.nickname, feedback.comment, feedback.submit_time");
        $this->db->from("feedback, user");
        $this->db->where("feedback.user_id = user.no");
        $this->db->where("feedback.event_id", $event_id);
        $this->db->group_by("feedback.no");
        $this->db->order_by("feedback.submit_time", "desc");
        $result = $this->db->get();

        return $result->result();
    }

    /**
     * This function is used to get the amount of rating information
     * @param number $searchName : This is id of member or phone
     * @return number $count : This is information of rating found
     */
    function itemListingCount($searchStatus = null, $searchName = '')
    {
        $query = "select count(feedback.no) as total_cnt 
            from feedback, user, event 
            where feedback.user_id = user.no and feedback.event_id = event.id ";
        if (!empty($searchText)) {
            if(isset($searchStatus)){
                if ($searchStatus == '0') {
                    $query = $query." and (user.nickname LIKE '%" . $searchText . "%')";
                } else {
                    $query = $query." and (event.name LIKE '%" . $searchText . "%')";
                }
            }
        }
        $result = $this->db->query($query);
        return $result->row()->total_cnt;
    }

    /**
     * This function is used to get the amount of rating information
     * @param number $searchName : This is id of member or phone
     * @return number $count : This is information of rating found
     */
    function itemListing($searchStatus = null, $searchText = '', $page, $segment)
    {
        $query = "select feedback.no, user.nickname, event.name, feedback.comment, feedback.submit_time 
            from feedback, user, event 
            where feedback.user_id = user.no and feedback.event_id = event.id ";
        if (!empty($searchText)) {
            if(isset($searchStatus)){
                if ($searchStatus == '0') {
                    $query = $query." and (user.nickname LIKE '%" . $searchText . "%')";
                } else {
                    $query = $query." and (event.name LIKE '%" . $searchText . "%')";
                }
            }
        }
        $query=$query." order by feedback.submit_time desc";
        if($segment!=""){
            $query = $query." limit ".$segment.", ".$page;
        }
        else{
            $query = $query." limit 0, ".$page;
        }
        $result = $this->db->query($query);
        return $result->result();
    }

    /**
     *This function is used to delete rating by id
     *@param number id : id to delete
     *@return boolean $result: state of delete
     **/
    function deleteItem($id)
    {
        $this->db->where("no", $id);
        $this->db->delete("feedback");
        return true;
    }

    /**
    *This is function to add feedback to event
    */
    function addFeedback($info){
        $this->db->insert('feedback', $info);
        return true;
    }

}

/* End of file feedback_model.php */
/* Location: .application/models/feedback_model.php */
