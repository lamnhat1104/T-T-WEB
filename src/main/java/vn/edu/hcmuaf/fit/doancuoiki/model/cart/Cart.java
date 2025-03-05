package vn.edu.hcmuaf.fit.doancuoiki.model.cart;

import vn.edu.hcmuaf.fit.doancuoiki.model.CartItem;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart {

    Map<Integer, CartProduct> data = new HashMap<>();
    private List<CartProduct> items;

    public boolean add(Product p){
        if(data.containsKey(p.getId())){
            return update(p.getId(), data.get(p.getId()).getQuantity()+1);
        }
        data.put(p.getId(), Convert(p));
        return true;
    }

    public boolean update(int id, int quantity){
        if(!data.containsKey(id)){
            return false;
        }
        CartProduct cartProduct = data.get(id);
        if(quantity<1) return false;
        cartProduct.setQuantity(quantity);
        data.put(id, cartProduct);
        return true;
    }

    public void update2(int id, int quantity){
        for(CartProduct c : items){
            if(c.getProduct().getId()==id){
                c.setQuantity(quantity);
                return;
            }
        }
    }

    public boolean remove(int id){
        return data.remove(id)!=null;
    }

    public List<CartProduct> getList(){
        return new ArrayList<>(data.values());
    }

    public int getTotalQuantity(){
        AtomicInteger i = new AtomicInteger();
        data.values().forEach(cp-> i.addAndGet(cp.getQuantity()));
        return i.get();
    }

    public Double getTotal(){
        AtomicReference<Double> i= new AtomicReference<>(0.0);
        data.values().forEach(cp -> i.updateAndGet(v -> (v + (cp.getQuantity() * cp.getQuantity()))));
        return i.get();
    }

    private CartProduct Convert(Product p){
        CartProduct re = new CartProduct();
        re.setId(p.getId());
        re.setTitle(p.getName());
        re.setPrice(p.getPrice());
        re.setImg(p.getImg());
        re.setQuantity(1);
        return re;
    }
}
