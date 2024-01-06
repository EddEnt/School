package chessclubgui;

import java.net.URL;
import java.util.Arrays;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.beans.property.ReadOnlyObjectWrapper;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ListChangeListener;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableView;
import javafx.scene.control.TableView.TableViewSelectionModel;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.util.Callback;

/* @author Alec */
public class FXMLDocumentController implements Initializable {

    @FXML
    private Label lbl_memberFirstName;
    @FXML
    private Label lbl_memberLastName;
    @FXML
    private Label lbl_memberTotalGamesName;
    @FXML
    private Label lbl_memberWins;
    @FXML
    private Label lbl_memberLosses;
    @FXML
    private Label lbl_memberWinLoseRation;
    @FXML
    private TableView table_memberList;
    @FXML
    private TextField txtField_firstName;
    @FXML
    private TextField txtField_lastName;
    @FXML
    private Tab tab_viewMembers;
    @FXML
    private Tab tab_manageMembers;
    @FXML
    private TabPane tabPane;

    private MemberManager mm;
    private int currentMemberId;

    @FXML
    private void handleAddWinAction(ActionEvent event) {
        if (currentMemberId != -1) {
            Alert alert = new Alert(AlertType.CONFIRMATION);
            alert.setTitle("Add Win to Member");
            alert.setHeaderText(null);
            alert.setContentText("Confirm to add one WIN to the selected Member");
            Optional<ButtonType> result = alert.showAndWait();
            if (result.get() == ButtonType.OK) {
                // User selected OK
                mm.addWinToMember(currentMemberId);
            } else {
                // User selected Cancel
            }
            table_memberList.refresh();
            updateCurrentMemberLabels();
        } else {
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("No member selected");
            alert.setHeaderText(null);
            alert.setContentText("Please click on one of the rows to select a member");
            alert.showAndWait();
        }
    }

    @FXML
    private void handleAddLossAction(ActionEvent event) {
        if (currentMemberId != -1) {
            Alert alert = new Alert(AlertType.CONFIRMATION);
            alert.setTitle("Add Loss to Member");
            alert.setHeaderText(null);
            alert.setContentText("Confirm to add one LOSS to the selected Member");
            Optional<ButtonType> result = alert.showAndWait();
            if (result.get() == ButtonType.OK) {
                // User selected OK
                mm.addLossToMember(currentMemberId);
            } else {
                // User selected Cancel
            }
            table_memberList.refresh();
            updateCurrentMemberLabels();
        } else {
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("No member selected");
            alert.setHeaderText(null);
            alert.setContentText("Please click on one of the rows to select a member");
            alert.showAndWait();
        }
    }

    @FXML
    private void handleAddDeleteMemberAction(ActionEvent event) {
        if (currentMemberId != -1) {
            Alert alert = new Alert(AlertType.CONFIRMATION);
            alert.setTitle("Delete Member");
            alert.setHeaderText(null);
            alert.setContentText("Are you sure that you want to delete the selected member?");
            Optional<ButtonType> result = alert.showAndWait();
            if (result.get() == ButtonType.OK) {
                // User selected OK
                mm.deleteMember(currentMemberId);
                table_memberList.getItems().remove(table_memberList.getSelectionModel().getSelectedItem());
                currentMemberId = -1;
            } else {
                // User selected Cancel
            }
            table_memberList.refresh();
            updateCurrentMemberLabels();
        } else {
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("No member selected");
            alert.setHeaderText(null);
            alert.setContentText("Please click on one of the rows to select a member");
            alert.showAndWait();
        }
    }

    @FXML
    private void handleAddMemberAction(ActionEvent event) {
        String pattern = "[a-zA-Z]+";
        String fName = txtField_firstName.getText();
        String lName = txtField_lastName.getText();
        if (fName.matches(pattern) && lName.matches(pattern)) {
            table_memberList.getItems().add(mm.addMemberAndReturnRef(fName, lName));
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("Add Member");
            alert.setHeaderText(null);
            alert.setContentText("Member was successfuly added");
            alert.showAndWait();
        }
        tabPane.getSelectionModel().select(tab_viewMembers);
    }

    private void updateCurrentMemberLabels() {
        Member temp = mm.getMemberWithId(currentMemberId);
        if (currentMemberId != -1) {
            lbl_memberFirstName.setText(temp.getFName());
            lbl_memberLastName.setText(temp.getLName());
            lbl_memberTotalGamesName.setText(Integer.toString(temp.getNumberOfGames()));
            lbl_memberWins.setText(Integer.toString(temp.getWins()));
            lbl_memberLosses.setText(Integer.toString(temp.getLosses()));
            lbl_memberWinLoseRation.setText(Double.toString(temp.getWLRatio()));
        } else {
            String dummy = "<No Member Selected>";
            lbl_memberFirstName.setText(dummy);
            lbl_memberLastName.setText(dummy);
            lbl_memberTotalGamesName.setText(dummy);
            lbl_memberWins.setText(dummy);
            lbl_memberLosses.setText(dummy);
            lbl_memberWinLoseRation.setText(dummy);
        }
    }

    private void createTable() {
        table_memberList.getColumns().clear();
        String[] headers = {"ID", "First Name", "Last Name", "Total Games", "Wins", "Losses", "W/L Ratio"};
        String[] propertyNames = {"id", "fName", "lName", "numberOfGames", "wins", "losses", "WLRatio"};
        int[] widths = {60, 125, 125, 85, 85, 85, 85};

        for (int i = 0; i < headers.length; i++) {
            TableColumn<String, Member> col = new TableColumn<>(headers[i]);
            col.setCellValueFactory(new PropertyValueFactory<>(propertyNames[i]));
            col.setPrefWidth(widths[i]);
            table_memberList.getColumns().add(col);
        }

        TableViewSelectionModel<Member> selectionModel = table_memberList.getSelectionModel();
        selectionModel.setSelectionMode(SelectionMode.SINGLE);
        ObservableList<Member> selectedItems = selectionModel.getSelectedItems();
        selectedItems.addListener(new ListChangeListener<Member>() {
            @Override
            public void onChanged(ListChangeListener.Change<? extends Member> change) {
                ObservableList<? extends Member> list = change.getList();
                if (list.size() > 0) {
                    currentMemberId = change.getList().get(0).getId();
                } else {
                    currentMemberId = -1;
                }
                updateCurrentMemberLabels();
            }
        });
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        mm = new MemberManager(1000);
        currentMemberId = -1;
        createTable();
    }
}
