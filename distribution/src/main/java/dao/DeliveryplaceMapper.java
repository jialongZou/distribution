package dao;

import entity.Deliveryplace;
import java.util.List;

public interface DeliveryplaceMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliveryplace
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String depid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliveryplace
     *
     * @mbg.generated
     */
    int insert(Deliveryplace record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliveryplace
     *
     * @mbg.generated
     */
    Deliveryplace selectByPrimaryKey(String depid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliveryplace
     *
     * @mbg.generated
     */
    List<Deliveryplace> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliveryplace
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Deliveryplace record);
}