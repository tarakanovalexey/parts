package com.javarush.parts.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="part")
public class Part {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Column(name="part_name")
    private String partName;

    @NotNull
    @Column(name="quantity")
    private Integer quantity;

    @NotNull
    @Column(name="is_required")
    private boolean isRequired;

    public Part() {
    }

    public Part(@NotNull String partName, @NotNull Integer quantity, @NotNull boolean isRequired) {
        this.partName = partName;
        this.quantity = quantity;
        this.isRequired = isRequired;
    }

    public Integer getId() {
        return id;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public boolean isRequired() {
        return isRequired;
    }

    public void setRequired(boolean required) {
        isRequired = required;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
