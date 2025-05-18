    package vn.edu.hcmuaf.fit.doancuoiki.model;

    import java.util.Date;

    public class Order {
        private int id;
        private int customerId;
        private Date createdDate;
        private Date retalStarDate;
        private Date expectedReturnDate;
        private Date actualReturnDate;
        private String deliveryAddress;
        private String paymentMethod;
        private int promotionId;
        private int status;
        private double additionalFee;
        private String additionalFeeNote;
        private OrderDetail orderDetail;
        private VehicleType vehicleType;

        public VehicleType getVehicleType() {
            return vehicleType;
        }

        public void setVehicleType(VehicleType vehicleType) {
            this.vehicleType = vehicleType;
        }

        public Order() {
        }

        public Order(int id, int customerId, Date createdDate, Date retalStarDate, Date expectedReturnDate, Date actualReturnDate, String deliveryAddress, String paymentMethod, int promotionId, int status, double additionalFee, String additionalFeeNote) {
            this.id = id;
            this.customerId = customerId;
            this.createdDate = createdDate;
            this.retalStarDate = retalStarDate;
            this.expectedReturnDate = expectedReturnDate;
            this.actualReturnDate = actualReturnDate;
            this.deliveryAddress = deliveryAddress;
            this.paymentMethod = paymentMethod;
            this.promotionId = promotionId;
            this.status = status;
            this.additionalFee = additionalFee;
            this.additionalFeeNote = additionalFeeNote;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getCustomerId() {
            return customerId;
        }

        public void setCustomerId(int customerId) {
            this.customerId = customerId;
        }

        public Date getCreatedDate() {
            return createdDate;
        }

        public void setCreatedDate(Date createdDate) {
            this.createdDate = createdDate;
        }

        public Date getRetalStarDate() {
            return retalStarDate;
        }

        public void setRetalStarDate(Date retalStarDate) {
            this.retalStarDate = retalStarDate;
        }

        public Date getExpectedReturnDate() {
            return expectedReturnDate;
        }

        public void setExpectedReturnDate(Date expectedReturnDate) {
            this.expectedReturnDate = expectedReturnDate;
        }

        public Date getActualReturnDate() {
            return actualReturnDate;
        }

        public void setActualReturnDate(Date actualReturnDate) {
            this.actualReturnDate = actualReturnDate;
        }

        public String getDeliveryAddress() {
            return deliveryAddress;
        }

        public void setDeliveryAddress(String deliveryAddress) {
            this.deliveryAddress = deliveryAddress;
        }

        public String getPaymentMethod() {
            return paymentMethod;
        }

        public void setPaymentMethod(String paymentMethod) {
            this.paymentMethod = paymentMethod;
        }

        public int getPromotionId() {
            return promotionId;
        }

        public void setPromotionId(int promotionId) {
            this.promotionId = promotionId;
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public double getAdditionalFee() {
            return additionalFee;
        }

        public void setAdditionalFee(double additionalFee) {
            this.additionalFee = additionalFee;
        }

        public String getAdditionalFeeNote() {
            return additionalFeeNote;
        }

        public void setAdditionalFeeNote(String additionalFeeNote) {
            this.additionalFeeNote = additionalFeeNote;
        }

        public OrderDetail getOrderDetail() {
            return orderDetail;
        }

        public void setOrderDetail(OrderDetail orderDetail) {
            this.orderDetail = orderDetail;
        }
    }
