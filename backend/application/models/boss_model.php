<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class boss_model extends CI_Model
{

    function addNewBoss($bossInfo, $user_id)
    {
        $result = $this->db->query("select no from boss where boss_id=" . $user_id)->result();
        if (count($result) > 0) {
            $this->db->where("boss_id", $user_id);
            $this->db->update("boss", $bossInfo);
        } else {
            $userInfo['boss_id'] = $user_id;
            $this->db->insert("boss", $bossInfo);
        }
        return true;
    }


    /**
     * This function is used to update the boss information
     * @param array $bossInfo : This is bosss updated information
     * @param number $bossId : This is boss id
     */
    function editboss($bossInfo, $bossId)
    {
        $this->db->where('bossId', $bossId);
        $this->db->update('boss', $bossInfo);

        return TRUE;
    }

    /**
     * This function is used to update the boss information
     * @param array $bossInfo : This is bosss updated information
     * @param number $bossId : This is boss id
     */
    function updateboss($bossInfo, $bossnickname)
    {
        $this->db->where('nickname', $bossnickname);
        $this->db->update('boss', $bossInfo);

        return TRUE;
    }

    /**
     * This function is used to delete the boss information
     * @param number $bossId : This is boss id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteboss($bossId, $bossInfo)
    {
        $this->db->where('bossId', $bossId);
        $this->db->update('boss', $bossInfo);

        return $this->db->affected_rows();
    }

    /**
     * This function is used to get the detailed information of site
     * @param number $bossId : This is boss id
     * @return array $result :  information of the site
     */
    function getSiteDetail($bossId, $userId)
    {
        $this->db->select("boss.detail_address, boss.site_name, boss.site_introduction, boss.site_service,user.phone, boss.boss_id");
        $this->db->select("avg(rating.point) as point, count(rating.id) as rating_amount");
        $this->db->select("provinces.province, cities.city, areas.area");
        $this->db->from("boss");
        $this->db->join("provinces", "provinces.id = boss.province");
        $this->db->join("cities", "cities.id = boss.city");
        $this->db->join("areas", "areas.id = boss.area");
        $this->db->join("user", "user.no = boss.boss_id");
        $this->db->join("event", 'event.organizer_id = boss.boss_id', 'left');
        $this->db->join("rating", "rating.event_id = event.id", 'left');
        $this->db->where("boss.boss_id", $bossId);
        $query = $this->db->get();
        return $query->result();

    }
    function getSiteRatingPoint($bossId)
    {
        $this->db->select("avg(rating.point) as point");
        $this->db->from("boss");
        $this->db->join("event", 'event.organizer_id = boss.boss_id', 'left');
        $this->db->join("rating", "rating.event_id = event.id", 'left');
        $this->db->where("boss.boss_id", $bossId);
        $query = $this->db->get();
        $result = array();
        $result = $query->result();
        return (count($result) > 0) ? $result[0]->point : 0;
    }

    /**
     *This function is used to get the state of which the site is in the list of favourite sites of the current user
     * @param number $userId : This is the id of current user
     * @param number $bossId : This is the id of boss of the wanted site
     * @return boolean $result : state of the site
     */
    function isFavourite($userId, $bossId)
    {
        $this->db->select("no");
        $this->db->from("favourite");
        $this->db->where("user_id", $userId);
        $this->db->where("boss_id", $bossId);
        $query = $this->db->get();
        $result = $query->result();
        return (count($result) > 0) ? true : false;
    }

    function isFavouriteState($userId, $bossId)
    {
        $this->db->select("no");
        $this->db->from("favourite");
        $this->db->where("user_id", $userId);
        $this->db->where("boss_id", $bossId);
        $query = $this->db->get();
        $result = $query->result();
        return (count($result) > 0) ? 1 : 0;
    }
    /**
     *This function is used to get count of favourite about site
     * @param number $bossId : This is the id of boss of the wanted site
     * @return number $result : count of the favourite
     */
    function getFavouriteCount($bossId)
    {
        $this->db->select("no");
        $this->db->from("favourite");
        $this->db->where("boss_id", $bossId);
        $query = $this->db->get();
        $result = $query->result();
        return count($result);
    }

    /**
     * This function is used to get the pictures of the site
     * @param number $bossId : This is boss id
     * @return array $result : picture URL of the site
     */
    function getSitePictures($bossId)
    {
        $this->db->select("picture");
        $this->db->from("site_picture");
        $this->db->where("boss_id", $bossId);
        $query = $this->db->get();
        return $query->result();
    }

    function getAreaName($areaId)
    {
        $this->db->select("AREA");
        $this->db->from("areas");
        $this->db->where("id", $areaId);
        $query = $this->db->get();
        $result = array();
        $result = $query->result();
        return $result[0]->AREA;
    }

    /**
     * This function is used to get status of the site
     * @param number $bossId : This is boss id
     * @return boolean $result : status of inputing information
     */
    function getSiteStatus($bossId)
    {
        $this->db->select("site_type, site_introduction, site_service");
        $this->db->from("boss");
        $this->db->where("boss_id", $bossId);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

    /**
     * This function is used to add information of the site
     * @param number $bossId : This is boss id
     * @param array $info : This is the array of information
     * @return boolean $result : status of inputing information
     */
    function addSiteInfo($bossId, $info)
    {
        $this->db->where("boss_id", $bossId);
        $this->db->update("boss", $info);
        $result = $this->db->affected_rows();
        return (count($result) > 0) ? true : false;
    }

    /**
     * This function is used to edit information of the site
     * @param number $bossId : This is boss id
     * @param array $info : This is the array of information
     * @return boolean $result : status of inputing information
     */
    function editSiteInfo($bossId, $info)
    {
        $this->db->trans_start();
        $this->db->where("boss_id", $bossId);
        $this->db->update("boss", $info);
        $result = $this->deleteSitePicture($bossId);
        $this->db->trans_complete();
        //$result = $this->db->affected_rows();
        return (count($result) > 0) ? true : false;
    }

    /**
     * This function is used to delete all pictures of site
     * @param number $bossId : This is boss id
     * @return boolean $result : status of delete
     */
    function deleteSitePicture($bossId)
    {
        $this->db->where("boss_id", $bossId);
        $result = $this->db->delete("site_picture");
        return $result;
    }

    /**
     * This function is used to edit information of the site
     * @param number $bossId : This is boss id
     * @param string $picture : This is the filename of picture
     * @return boolean $result : status of inputing information
     */
    function addSitePicture($bossId, $picture)
    {
        $info['boss_id'] = $bossId;
        $info['picture'] = $picture;
        $this->db->insert('site_picture', $info);
        $result = $this->db->affected_rows();
        return ($result > 0) ? true : false;
    }

    function getActivityByBoss($boss_id)
    {
        $this->db->select("event.id, event.pic, event.name, event.type, event.start_time, event.end_time, event.state, event.cost,provinces.province, cities.city, areas.area, event.detail_address, user.role, user.avatar, sum(booking.reg_num) as register_num");
        $this->db->from("event");
        $this->db->join("provinces", "provinces.id=event.province");
        $this->db->join("cities", "cities.id=event.city");
        $this->db->join("areas", "areas.id=event.area");
        $this->db->join("user", "user.no = event.organizer_id");
        $this->db->join("booking", "event.id = booking.event_id and booking.state = event.state","left");
        $this->db->where("event.organizer_id", $boss_id);
        $this->db->where('event.state', 0);
        $this->db->group_by("event.id");
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * This function is used to get the sites in 5km from current user
     * @param float $longitude : This is longitude of current user
     * @param float $latitude : This is latitude of the current user
     * @return array $result : information of sites found
     */
    
    function getSiteByDistanceApi($longitude, $latitude, $userId)
    {
        $this->db->select("boss_id, site_name, longitude, latitude, site_type, area");
        $this->db->from("boss");
        $this->db->where("( 6371 * acos( cos( radians($latitude) ) * cos( radians( latitude) )
   * cos( radians(longitude) - radians($longitude)) + sin(radians($latitude))
   * sin( radians(latitude))))<=5");
        $query = $this->db->get();

        $response_array = array();
        foreach ($query->result() as $item) {

            $isFavourite = $this->isFavouriteState($userId, $item->boss_id);

            $site_icon = "map_icon.png";
            $picture_array = array();
            $picture_array = $this->getSitePictures($item->boss_id);
            if (count($picture_array) > 0)
            {
                $site_icon = $picture_array[0]->picture;
            }
            $area_name = $this->getAreaName($item->area);
            $event_array = $this->getActivityByBoss($item->boss_id);
            $event_state = 0;
            if (count($event_array) > 0)
            {
                $event_state = 1;
            }


            $point = number_format((float)$this->getSiteRatingPoint($item->boss_id), 1, '.', '');
            $favouriteCount = $this->getFavouriteCount($item->boss_id);
            $distance = $this->distance($latitude, $longitude, $item->latitude, $item->longitude, "K");
            $show_distance_str = "0km";
            if ($distance > 1) {
                $show_distance_str = number_format((float)$distance, 1, '.', '') . "km";
            } else {
                $show_distance_str = intval($distance * 1000) . "m";
            }
            $response_data = array('boss_id' => $item->boss_id, 'site_name' => $item->site_name,
                'longitude' => $item->longitude, 'latitude' => $item->latitude, 'site_type' => $item->site_type,
                'site_icon' => $site_icon, 'point' => $point, 'event_state' => $event_state, 'areaId' => $item->area, 'areaName' => $area_name, 'isfavourite' => $isFavourite, 'favourite_count' => $favouriteCount, 'show_distance_str' => $show_distance_str, 'distance' => number_format((float)$distance, 1, '.', ''));
            array_push($response_array, $response_data);
        }
        return $response_array;
    }

    function distance($lat1, $lon1, $lat2, $lon2, $unit)
    {

        $theta = $lon1 - $lon2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $unit = strtoupper($unit);

        if ($unit == "K") {
            return ($miles * 1.609344);
        } else if ($unit == "N") {
            return ($miles * 0.8684);
        } else {
            return $miles;
        }
    }

    function getSiteByDistance($longitude, $latitude)
    {
        $this->db->select("boss_id, longitude, latitude, site_type, map_icon as site_icon");
        $this->db->from("boss");
        $this->db->where("( 6371 * acos( cos( radians($latitude) ) * cos( radians( latitude) ) 
   * cos( radians(longitude) - radians($longitude)) + sin(radians($latitude)) 
   * sin( radians(latitude))))<=5");
        $query = $this->db->get();
        return $query->result();

    }
}

/* End of file boss_model.php */
/* Location: .application/models/boss_model.php */

//added new funtions
