<?php
namespace App\Controller;

use App\Service\DompdfService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;

class ImpressionController extends AbstractController
{
    #[Route('admin/impression', name: 'app_impression')]
    public function index(EntityManagerInterface $entityManager,DompdfService $dompdfService): Response
    {
        // Récupérer tous les plannings de garde
        $query = $entityManager->createQuery(    
            'SELECT pg, p
            FROM App\Entity\PlanningGarde pg
            JOIN pg.idPharmacie p
            ORDER BY pg.dateDebut ASC'
        );
        $planningGardes = $query->getResult();

        // Transformez vos données en un tableau structuré
        $planning = [];
        foreach ($planningGardes as $planningGarde) {
            $mois = $planningGarde->getDateDebut()->format('F');
            $planning[$mois][] = [
                'dateDebut' => $planningGarde->getDateDebut(),
                'dateFin' => $planningGarde->getDateFin(),
                'pharmacy' => [
                    'nom' => $planningGarde->getIdPharmacie()->getNomPharma(), // Remplacé par getNomPharma()
                    'tel' => $planningGarde->getIdPharmacie()->getTel(),
                ]
            ];
        }

        // Vérifiez si le planning est vide
        if (empty($planning)) {
            return $this->render('impression/index.html.twig', [
                'planning' => null,
                'controller_name' => 'ImpressionController',
                'message' => "Aucun planning de garde disponible.",
            ]);
        }

        // Passer les plannings au template
        $html = $this->render('impression/index.html.twig', [
            'planning' => $planning,
            'controller_name' => 'ImpressionController',
            'message' => null,
        ]);
        return $dompdfService->generatePdf($html, 'planning_pharmacies.pdf');
    }
}
