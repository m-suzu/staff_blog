package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "reactions")
@NamedQueries({
    @NamedQuery(
            name = "getReactionCountByType",
            query = "SELECT COUNT(r) FROM Reaction AS r WHERE r.report_id = :report_id AND r.type = :type"
        ),
    @NamedQuery(
            name = "getReactionCountByTypeAndUser",
            query = "SELECT COUNT(r) FROM Reaction AS r WHERE r.report_id = :report_id AND r.type = :type AND r.employee = :employee"
        )
})

@Entity
public class Reaction {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Employee employee;

    @Column(name = "type")
    private Integer type;

    @Column(name = "report_id")
    private Integer report_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getReport_id() {
        return report_id;
    }

    public void setReport_id(Integer report_id) {
        this.report_id = report_id;
    }
}